require 'gmail'

class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:cart, :add_to_cart, :buy_product]

  def index
  	@products = Product.all
  	@products = @products.page params[:page]
  end

  def welcome
  	@products = Product.all
  	@products = @products.page params[:page]
  end

  def search
  	if params[:search].blank?  
    	redirect_to(home_welcome_path, alert: "Empty field!") and return  
    else  
    	@parameter = params[:search].downcase  
    	@products = Product.all.where("lower(name) LIKE :search", search: @parameter)
      @brands = Brand.all.where("lower(name) LIKE :search", search: @parameter) 
    	redirect_to home_show_search_path(:search => params[:search].downcase)
    end  

    if @products.present?
      @proBrand = @products.first.brand
    else
      @brand = @brands.first.products
    end
  end

  def show_search
  	@parameter = params["search"]
    @products = Product.all.where("lower(name) LIKE :search", search: @parameter)
    @brands = Brand.all.where("lower(name) LIKE :search", search: @parameter) 
    if @products.present?
      @proBrand = @products.first.brand
    elsif @brands.present?
      @brand = @brands.first.products
    else
      flash[:notice] = "Search not availabe....!"
      redirect_to root_path
    end
  end

  def add_to_cart
    @parameter = params["id"]
    @prod =Product.find(@parameter)
    @cart = Cart.create(product_id: params["id"], user_id: current_user.id)
    if @cart.save
      flash[:notice] = "Product successfully added to cart....!"
      redirect_to(home_welcome_path) and return
    else
      flash[:alert] = "Product already in cart!"
      redirect_to(home_welcome_path) and return
    end
    current_u_id = current_user.id
    user = User.find(current_u_id)
    @all_cart = user.carts
  end

  def cart
    current_u_id = current_user.id
    user = User.find(current_u_id)
    @all_cart = user.carts
    @cart = Cart.all
  end

  def remove_cart
    @remove_cart = Cart.find_by_product_id(params["id"])
    if @remove_cart.destroy  
      flash[:notice] = "Product removed from cart....!"
      redirect_to home_cart_path and return
    else
      render 'home_cart_path'
    end
  end

  def buy_product
    @cart_prod = Product.find_by_id(params["id"])
  end

  def continue_order
    @cart_product = Product.find_by_id(params["id"])
    @quantity_params = params[:quantity].to_i
  end

  def send_mail
    @cart_product = Product.find_by_id(params["id"])
    @cart = Product.find(params[:id])
    @quantity_params = params[:quantity]
    @total = params[:total].to_i

    @order = Order.create(product_id: params["id"], user_name: current_user.name, price: params["total"], quantity: params["quantity"])
    @order_id = @order.id
    if @order.save
      create_send_pdf
    end


    if params[:quantity].to_i <= @cart_product.quantity
      @diff_quantity = @cart_product.quantity - @quantity_params.to_i 
      @cart_product.quantity = @diff_quantity
      @cart_product.save      
    else
      flash[:alert] = "Please order only what's available #{@cart_product.quantity}"
      redirect_to buy_product_path(params[:id])
    end

    @gmail = Gmail.connect("27.11.1994.monali@gmail.com", "monali@27")
    data = current_user.email
    data_name = current_user.name
    prod_name = @cart_product.name
    prod_price = @cart_product.price
    prod_quantity = params[:quantity]
    prod_image =  @cart_product.images

    split_name = current_user.name.split(' ')
    o_idd = @order.id
    
    email_body = "Your Order Number is #{@order.id}\n #{data_name}\n Product Details \n Product Name #{prod_name} \n Price #{prod_price} \n Quantity #{prod_quantity}\nThank You FOR SHOPPING with SHOPPING CART"
    @gmail.deliver do
      to "#{data}"
      subject "Your Order Is Confirmed"
      body email_body
      add_file "/home/monali/shopping_cart/app/pdfs/#{split_name.first}_#{o_idd}.pdf"
    end
  end

  def create_send_pdf
    @o_id = params["order_id"].to_i
    @cart_product = Product.find_by_id(params["id"])

    split_name = current_user.name.split(' ')

    total = params[:total].to_i

    pdf = Prawn::Document.new
    pdf.text "Date - #{Date.today}"
    data =[
            ["#{current_user.name}"],
            ["Order Details"],
            ["Product Name - #{@cart_product.name}"],
            ["Price - #{@cart_product.price}"],
            ["Quantity - #{params["quantity"]}"],
            ["Total - #{params["total"]}"],
            ["Thank You For Shopping With Us!!!"]
           ]
    pdf.table(data) do
     cells.padding = 12  
     cells.borders =[]  
     row(0).borders      =[:bottom]
     row(0).font_style   = :bold  
     row(4).borders      =[:bottom]  
     row(0).border_width = 1  
     
     row(5).font_style   =:italic  
     row(5).font = "Times-Roman"
     
     columns(0..1).position =[:center]  
     row(0).columns(0..1).borders =[:bottom]
     row(3).border_lines = [:dotted]
     row(0).border_lines = [:dotted]
     row(1).text_align = [:center]
     row(0).position = [:center]
     row(6).text_color = "FF004D"
   end
    
    pdf.render_file "/home/monali/shopping_cart/app/pdfs/#{split_name.first}_#{@order.id}.pdf"
  end

  def pdf_show
    @o_id = params["order_id"].to_i
    @cart_product = Product.find_by_id(params["id"])

    split_name = current_user.name.split(' ')

    total = params[:total].to_i

    pdf = Prawn::Document.new
    pdf.text "Date - #{Date.today}"
    data =[
            ["#{current_user.name}"],
            ["Order Details"],
            ["Product Name - #{@cart_product.name}"],
            ["Price - #{@cart_product.price}"],
            ["Quantity - #{params["quantity"]}"],
            ["Total - #{params["total"]}"],
            ["Thank You For Shopping With Us!!!"]
           ]
    pdf.table(data) do
     cells.padding = 12  
     cells.borders =[]  
     row(0).borders      =[:bottom]
     row(0).font_style   = :bold  
     row(4).borders      =[:bottom]  
     row(0).border_width = 1  
     
     row(5).font_style   =:italic  
     row(5).font = "Times-Roman"
     
     columns(0..1).position =[:center]  
     row(0).columns(0..1).borders =[:bottom]
     row(3).border_lines = [:dotted]
     row(0).border_lines = [:dotted]
     row(1).text_align = [:center]
     row(0).position = [:center]
     row(6).text_color = "FF004D"
   end
    
    pdf.render_file "/home/monali/shopping_cart/app/pdfs/#{split_name.first}_#{@o_id}.pdf"
    send_data pdf.render, 
           filename: "#{current_user.name}.pdf", 
           type: 'application/pdf',
           disposition: 'inline'
  end
end

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
    pdf = CartPdf.new(@cart, @view, @total,@quantity_params,@current_user)
    @gmail.deliver do
    to "#{data}"
    subject "Your Order Is Confirmed"
    body "#{data_name}\n Product Details \n Product Name #{prod_name} \n Price #{prod_price} \n Quantity #{prod_quantity}"
    end
  end

  def pdf_show
    @cart_product = Product.find_by_id(params["id"])
    @cart = Product.find(params[:id])
    @quantity_params = params[:quantity]
    @current_user=current_user.name
    @total = params[:total].to_i

    respond_to do |format|
    format.html
    format.pdf do
    pdf = CartPdf.new(@cart, @view, @total,@quantity_params,@current_user)
    pdf.fill_color "f0ffc1"
   

    send_data pdf.render, 
          filename: "cart_#{@cart}",
          type: 'application/pdf',
          disposition: 'inline'
    end
    end
  end
end

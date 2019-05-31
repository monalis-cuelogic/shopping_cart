require 'gmail'

class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:cart, :add_to_cart]

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
    	#redirect_to home_show_search_path(:search => params[:search].downcase)
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
   # @prod =Product.find(params[:id])
    if @products.present?
      @proBrand = @products.first.brand
      
    else
      @brand = @brands.first.products
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
      flash[:alert] = "Product allready in cart!"
      redirect_to(home_welcome_path) and return
    end
    current_u_id = current_user.id
    user = User.find(current_u_id)
    @all_cart = user.carts
  end

  def cart
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
    @quantity_params = params[:quantity]
  end

  def send_mail

    @cart_product = Product.find_by_id(params["id"])
    @cart = Product.find(params[:id])
    @quantity_params = params[:quantity]
    @total = params[:total].to_i



    # @gmail = Gmail.connect("27.11.1994.monali@gmail.com", "monali@27")
    # data = current_user.email
    # @gmail.deliver do
    # to "#{data}"
    # subject "Your Order Is Confirmed"  
    # end

    respond_to do |format|
    format.html
    format.pdf do
    pdf = CartPdf.new(@cart, @view, @total,@quantity_params)
    pdf.fill_color "f0ffc1"
   

    send_data pdf.render, 
          filename: "cart_#{@cart}",
          type: 'application/pdf',
          disposition: 'inline'
        
    end
    end

  end

end

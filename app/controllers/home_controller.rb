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
    binding.pry

    @remove_cart = Cart.find_by_product_id(params["id"])
    if @remove_cart.destroy  
      flash[:notice] = "Product removed from cart....!"
      redirect_to home_cart_path and return
    else
      render 'home_cart_path'
    end
  end

end
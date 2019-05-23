class HomeController < ApplicationController
  #before_action :authenticate_user!

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
   # @prod =Product.find(params[:id])
    if @products.present?
      @proBrand = @products.first.brand
      
    else
      @brand = @brands.first.products
    end
  
  end
  def add_to_cart
    binding.pry
   @parameter = params["id"]
   @prod =Product.find(@parameter)
  end

end
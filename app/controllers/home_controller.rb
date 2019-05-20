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

end

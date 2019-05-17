class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  	@products = Product.all
  end

  def welcome
  end

end

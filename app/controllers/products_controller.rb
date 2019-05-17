  class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user!
  def show
    @products = Product.all
    @products = @products.page params[:page]
  end

  def new
    @product=Product.new
  end

  def create
    
    @product = Product.new(product_params)
    @product.save
    redirect_to products_show_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_show_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy  
    redirect_to products_show_path

  end
  
  private
    def set_user!
        admin = Role.find_by_name("admin")
        if current_user.present? && current_user.role_id != admin.id
          redirect_to root_path
        end
      end
    def product_params
      params.require(:product).permit(:id, :name, :price, :brand_id, :quantity, :description, :size, {images: []})
    end
end

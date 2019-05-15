class ProductsController < ApplicationController
  def show
    @product = Product.all
  end
  def new
    @product=Product.new
  end
  def create
    @product = Product.new(product_params)
    @product.save
    #redirect_to brands_show_path
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
    def product_params
      params.require(:product).permit(:id, :name, :price, :quantity, :description, :size, {images: []})
    end
end

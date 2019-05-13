class BrandsController < ApplicationController
	def show
        @user = current_user
        redirect_to root_path, warning: "You are not authorized" unless @user.name='admin'?
		@brand=Brand.all
	end
	def new
		@brand = Brand.new
	end
	def create
		@brand=Brand.new(brand_params)
		@brand.save
		redirect_to brands_show_path
	end
	def edit
		@brand=Brand.find(params[:id])
	end
	def update
		binding.pry
		@brand = Brand.find(params[:id])
 
	    if @brand.update(brand_params)
	   		redirect_to brands_show_path
	    else
	    	render 'edit'
	    end
	end
	def destroy
		@brand = Brand.find(params[:id])
		@brand.destroy

		redirect_to brands_show_path
    end

    private
    	def brand_params
    		params.require(:brand).permit(:id, :name, :description, :logo)
    	end
end
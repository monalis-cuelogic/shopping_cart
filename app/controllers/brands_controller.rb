class BrandsController < ApplicationController
    before_action :authenticate_user!
	def show
		if current_user.role_id == 1 
			@brand=Brand.all
		else
			redirect_to root_path
		end
	end

	def new
		if current_user.role_id == 1 
			@brand = Brand.new
		else
			redirect_to root_path
		end
	end

	def create
		@brand=Brand.new(brand_params)
		@brand.save
		redirect_to brands_show_path
	end

	def edit
		if current_user.role_id == 1 
			@brand=Brand.find(params[:id])
		else
			redirect_to root_path
		end
		
	end

	def update
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
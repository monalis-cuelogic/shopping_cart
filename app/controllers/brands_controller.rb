class BrandsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user!
  def show
    @brand=Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand=Brand.new(brand_params)
    if @brand.save
    redirect_to brands_show_path
    else
      render 'new'
    end
  end

  def edit
    @brand=Brand.find(params[:id])
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
    def set_user!
      admin = Role.find_by_name("admin")
      if current_user.present? && current_user.role_id != admin.id
        redirect_to root_path
      end
    end

    def brand_params
      params.require(:brand).permit(:id, :name, :description, :logo)
    end
end
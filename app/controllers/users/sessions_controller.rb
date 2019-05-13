# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    binding.pry
    super
  end

  # POST /resource/sign_in
  def create
    binding.pry
    # if current_user.role_id == 1
    #   redirect_to brands_show_path
    # else
    #   redirect_to home_welcome_path
    # end
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

class ApplicationController < ActionController::Base
	before_action :store_user_location!, if: :storable_location?
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	private
	
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.fullpath)
    end

	protected

	def configure_permitted_parameters      
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address])
  end
end

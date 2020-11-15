class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	
	


	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
		devise_parameter_sanitizer.permit(:account_update) do |user_params|
   			 user_params.permit(:name, :username, :email, :name, :dni, :date_of_birth,:password, :password_confirmation,:current_password)
  	end
	end

	

  

end

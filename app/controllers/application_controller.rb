class ApplicationController < ActionController::Base
	before_action :set_current_user
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :password)}
	end


	def after_sign_in_path_for(resource)
		user_path(@user.id)
	end
	def after_sign_out_path_for(resource)
		flash[:notice] = "Signed out successfully."
		root_path
	end

	def authenticate_user
		if @current_user == nil
			redirect_to new_user_session_path
		end
	end

	def set_current_user
		@current_user = User.find_by(id: session[:user_id])
	end
end

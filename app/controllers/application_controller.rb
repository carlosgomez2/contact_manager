class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation]

      if params[:action] == 'update'
        devise_parameter_sanitizer.permit(:account_update) do |u| 
          u.permit(registration_params << :current_password)
        end
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.permit(:sign_up) do |u| 
          u.permit(registration_params) 
        end
      end
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end

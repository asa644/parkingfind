class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:avatar, :avatar_cache,:avatar_url])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:avatar, :avatar_cache,:avatar_url])
  end

end


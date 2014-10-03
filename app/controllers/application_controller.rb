class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  #check if cancan is used

  #after_filter :ensure_cancan_used
  #def ensure_cancan_used
  #  raise "CanCan not used in this controller action." unless instance_variable_defined?(:@current_ability)
  #end
  ####

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied"
    redirect_to root_url
  end

  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) << :first_name
    #devise_parameter_sanitizer.for(:sign_up) << :last_name
    #devise_parameter_sanitizer.for(:account_update) << :first_name
    #devise_parameter_sanitizer.for(:account_update) << :last_name
    #devise_parameter_sanitizer.for(:account_update) << :avatar_url
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, roles: [])}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name, :password, :password_confirmation, :avatar_url, :current_password, :email, roles: [])}
  end

end

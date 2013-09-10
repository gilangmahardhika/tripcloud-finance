class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :breadcrumb_separator
  add_breadcrumb "<i class=icon-home></i>Dashboard".html_safe, :dashboard_index_url

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end
  
  def current_user
  	@current_user ||= AdminUser.find(session[:admin_user_id]) if session[:admin_user_id]
  end

  def breadcrumb_separator
    (" > ").html_safe
  end
end

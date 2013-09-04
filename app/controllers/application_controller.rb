class ApplicationController < ActionController::Base
  protect_from_forgery


  helper_method :current_user
  add_breadcrumb "<i class=icon-home></i>Dashboard".html_safe, :dashboard_index_url

  # protected
  
  private
  def current_user
  	@current_user ||= AdminUser.find(session[:admin_user_id]) if session[:admin_user_id]
  end

  
end

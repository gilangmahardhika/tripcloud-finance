class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private
  def current_user
  	@current_user ||= AdminUser.find(session[:admin_user_id]) if session[:admin_user_id]
  end
end

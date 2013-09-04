class DashboardController < ApplicationController
	before_filter :check_active_user
  def index
  	@title = "Dashboard"
  end

  def check_active_user
    unless current_user && current_user.role != nil && current_user.active == true
      flash[:error] = "Access Denied"
      redirect_to :root
    end
  end
end

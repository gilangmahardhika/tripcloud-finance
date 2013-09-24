class DashboardController < ApplicationController
	before_filter :check_active_user
  def index
  	@title = "Dashboard"
    @last_transactions = Transaction.where{time_limit >= Time.now}.order{[time_limit.asc]}.limit(5)
  end

  def check_active_user
    unless current_user && current_user.role != nil && current_user.active == true
      flash[:error] = "Access Denied"
      redirect_to :root
    end
  end
end

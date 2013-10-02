class DashboardController < ApplicationController
	before_filter :check_active_user
  def index
  	@title = "Dashboard"
    @last_transactions = Transaction.almost_expired
    @transactions = Transaction.all
    @paxes = Pax.all
    @total_price = Transaction.sum_price_formatted_k("total_price")
  end

  def check_active_user
    unless current_user && current_user.role != nil && current_user.active == true
      flash[:error] = "Access Denied"
      redirect_to :root
    end
  end
end

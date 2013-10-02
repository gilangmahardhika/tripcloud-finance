class HomeController < ApplicationController
  before_filter :check_active_user, only: [:index]
  skip_before_filter :authorize_page
	layout "login/login"
  
  def index
  	@title = "Login"
  end

  def login
  	user = AdminUser.login(params[:admin_user])
  	if user
  		if user.authenticate(params[:admin_user][:password])
	  		session[:admin_user_id] = user.id
	  		redirect_to dashboard_index_url, notice: "Login successfull"
	  	else
	  		authentication_fail
	  	end
  	else
  			authentication_fail
  	end
  end

  def logout
  	session[:admin_user_id] = nil
  	redirect_to root_url, notice: "Logout successfull"
  end

  private

  def authentication_fail
  	flash[:error] = "Login failed"
  	redirect_to home_index_url
  end

  def check_active_user
    if current_user && current_user.role != nil && current_user.active == true
      redirect_to dashboard_index_url
    end
  end
end

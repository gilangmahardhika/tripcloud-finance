class HomeController < ApplicationController
	layout "login/login"
  def index
  end

  def login
  	user = AdminUser.login(params[:admin_user])
  	if user
  		if user.authenticate(params[:admin_user][:password])
	  		# binding.pry
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
  	redirect_to home_index_url, notice: "Logout successfull"
  end

  private
  def authentication_fail
  	flash[:error] = "Login failed"
  	redirect_to home_index_url
  end
end

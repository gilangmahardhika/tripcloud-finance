class BankAccountsController < ApplicationController
	helper_method :index_path
	add_breadcrumb "Bank accounts", :index_path
  def index
  end

  def new
  	@title = "Add new"
  	add_breadcrumb "Add new", new_bank_account_path
  end

  def edit
  	@title = "Edit"
  	add_breadcrumb "Edit"
  end

  def create
  	
  end

  def update
  	
  end

  def destroy
  	
  end

  private
  def index_path
  	bank_accounts_path
  end
end

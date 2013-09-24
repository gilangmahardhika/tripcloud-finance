class BankAccountsController < ApplicationController
	helper_method :index_path
	add_breadcrumb "Bank accounts", :index_path
  def index
    @bank_accounts = BankAccount.order{[bank_name.asc]}
  end

  def new
  	@title = "Add new"
  	add_breadcrumb "Add new", new_bank_account_path
    @bank_account = BankAccount.new
  end

  def edit
    @bank_account = BankAccount.find(params[:id])
  	@title = "Edit"
  	add_breadcrumb "Edit"
  end

  def create
    @title = "Add new"
    add_breadcrumb "Add new", new_bank_account_path
  	@bank_account = BankAccount.new(params[:bank_account])
    if @bank_account.save
      redirect_to bank_accounts_url, notice: "Successfully create bank account"
    else
      flash[:notice] = "Failed to create bank account"
      render action: "new"
    end
  end

  def update
    @title = "Edit"
    add_breadcrumb "Edit"
  	@bank_account = BankAccount.find(params[:id])
    if @bank_account.update_attributes(params[:bank_account])
      redirect_to bank_accounts_url, notice: "Successfully update bank account"
    else
      flash[:notice] = "Failed to update bank account"
      render action: "edit"
    end
  end

  def destroy
  	@bank_account = BankAccount.find(params[:id])
    if @bank_account.destroy
      redirect_to :back, notice: "Successfully delete bank account"
    else
      flash[:notice] = "Failed to delete bank account"
      render :back
    end
  end

  private
  def index_path
  	bank_accounts_path
  end
end

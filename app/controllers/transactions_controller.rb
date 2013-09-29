class TransactionsController < ApplicationController
	add_breadcrumb "Transactions", :index_path
	helper_method :index_path
  def index
  	@title = "Transactions"
  	@transactions = Transaction.includes(:admin_user, :paxes).order{[created_at.desc]}.page(params[:page]).per(15)
  end

  def new
  	add_breadcrumb "Add new", new_transaction_path
  	@title = "Add new"
  	@transaction = Transaction.new 
    @transaction.paxes.build
  end

  def edit
  	@title = "Edit"
  	@transaction = Transaction.find(params[:id])
  	add_breadcrumb "Edit", edit_transaction_path(@transaction)
  end

  def show
    @bank_accounts = BankAccount.order{[bank_name.asc]}
  	@title = "Transaction"
  	@transaction = Transaction.includes(:admin_user, :paxes).find(params[:id])
  	add_breadcrumb "Show", transaction_path(@transaction)
  end

  def create
  	params[:transaction][:admin_user_id] = current_user.id
  	@transaction = Transaction.new(params[:transaction])
  	@title = "Add new"
  	add_breadcrumb "Add new", new_transaction_path
  	if @transaction.save!
  		redirect_to transactions_path, notice: "Successfully create transaction"
  	else
  		render action: "new"
  	end
  end

  def update
  	@transaction = Transaction.find(params[:id])
  	@title = "Edit"
  	add_breadcrumb "Edit", edit_transaction_path(@transaction)
  	if @transaction.update_attributes(params[:transaction])
  		redirect_to transaction_path, notice: "Successfully update transaction"
  	else
  		render action: "new"
  	end
  end

  def destroy
  	@transaction = Transaction.find(params[:id])
  	if @transaction.destroy
  		redirect_to :back, notice: "Successfully delete transaction"
  	else
  		flash[:error] = "Failed to delete transaction"
  		redirect_to :back
  	end
  end

  def send_email
    @transaction = Transaction.find(params[:id])
    # MailingWorker.perform_async(@transaction, "admin@tripclouds.com", "gilangmahardhika@gmail.com")
    InvoiceMailer.invoice_email(@transaction, "admin@tripclouds.com", "gilangmahardhika@gmail.com").deliver
    redirect_to @transaction
  end

  private
  def index_path
  	transactions_path
  end
end

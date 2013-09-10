class TransactionsController < ApplicationController
	add_breadcrumb "Transactions", :index_path
	helper_method :index_path
  def index
  	@title = "Transactions"
  	@transactions = Transaction.order{[created_at.desc]}.page(params[:page]).per(15)
  end

  def new
  	add_breadcrumb "Add new", new_transaction_path
  	@title = "Add new"
  	@transaction = Transaction.new 
  end

  def edit
  	@title = "Edit"
  	@transaction = Transaction.find(params[:id])
  	add_breadcrumb "Edit", edit_transaction_path(@transaction)
  end

  def show
  	@title = "Transaction"
  	@transaction = Transaction.includes(:customer, :city, :airline).find(params[:id])
  	add_breadcrumb @transactions.name, transaction_path(@transactions)
  end

  def create
  	@transaction = Transaction.new(params[:transaction])
  	@title = "Add new"
  	add_breadcrumb "Add new", new_transaction_path
  	if @transaction.save
  		redirect_to transaction_path, notice: "Successfully create transaction"
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

  private
  def index_path
  	transactions_path
  end
end

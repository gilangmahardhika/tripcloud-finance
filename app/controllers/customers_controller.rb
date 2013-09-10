class CustomersController < ApplicationController
	helper_method :index_path
	add_breadcrumb "Customers", :index_path
  def index
  	@title = "Customers"
  	@customers = Customer.order{[name.asc]}.page(params[:page]).per(15)
  end

  def new
  	@title = "Add new"
  	@customer = Customer.new
  	add_breadcrumb "Add new", new_customer_path
  end

  def edit
  	@customer = Customer.find(params[:id])
  	@title = "Edit customer"
  	add_breadcrumb "Edit", edit_customer_path(@customer)
  end

  def update
  	@customer = Customer.find(params[:id])
  	@title = "Edit"
  	add_breadcrumb "Edit", edit_customer_path(@customer)
  	if @customer.update_attributes(params[:customer])
  		redirect_to edit_customer_path(@customer), notice: "Succesfully update customer"
  	else
  		render action: "edit"
  	end
  end

  def create
  	@title = "Add new"
  	add_breadcrumb "Add new", new_customer_path
  	@customer = Customer.new(params[:customer])
  	if @customer.save
  		redirect_to customers_path, notice: "Successfully create customer"
  	else
  		render action: "new"
  	end
  end

  def destroy
  	@customer = Customer.find(params[:id])
  	if @customer.destroy
  		redirect_to :back, notice: "Successfully delete customer"
  	else
  		flash[:error] = "Failed to delete customer"
  		redirect_to :back
  	end
  end

  private
  def index_path
  	customers_path
  end
end

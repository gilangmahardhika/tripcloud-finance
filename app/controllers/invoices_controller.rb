class InvoicesController < ApplicationController
	helper_method :index_path
	add_breadcrumb "Invoice", :index_path
  def index
  end

  def search_result
  end

  private
  def index_path
  	invoices_path
  end
end

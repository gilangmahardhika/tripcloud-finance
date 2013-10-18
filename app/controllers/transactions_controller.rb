class TransactionsController < ApplicationController
  skip_before_filter :authorize_page, only: [:to_pdf]

	add_breadcrumb "Transactions", :index_path
	helper_method :index_path

  before_filter only:[:show, :to_pdf ] do
    @bank_accounts = BankAccount.order_by_name
  end

  def index
  	@title = "Transactions"
    @transactions = Transaction.order_last(params[:page])
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
  	@title = "Transaction"
  	@transaction = Transaction.show(params[:id])
  	add_breadcrumb "Show", transaction_path(@transaction)
  end

  def create
    @title = "Add new"
  	@transaction = Transaction.new(params[:transaction])
    @transaction.admin_user_id = current_user.id
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
    # MailingWorker.perform_async(params[:id].to_i, "admin@tripclouds.com", "gilangmahardhika@gmail.com")
    InvoiceMailer.delay.invoice_email(params[:id], "admin@listenonair.com", "gilangmahardhika@gmail.com")#.deliver
    redirect_to transaction_url(params[:id])
  end

  def to_pdf(id)
    transaction = Transaction.show(id)

    wicked = WickedPdf.new
    pdf_file = wicked.pdf_from_string(
      render_to_string(
        template:"transactions/to_pdf.html.erb",
        layout:"layouts/invoice.html.erb",
        locals:{
          transaction: transaction,
          bank_accounts: BankAccount.order_by_name
        }
      ),
      pdf:"invoice_#{transaction.invoice_number}",
      layout:"invoice",
      dispotition:"attachment"
    )

    path = File.join(Rails.root, "public", "files", "#{transaction.invoice_number}.pdf")
    file = File.open(path, "wb")
    file.write pdf_file
    file.close
    
    # respond_to  do |format|
    #   format.html { render layout: "invoice" }
    #   format.pdf do
    #     render pdf: "invoice_#{@transaction.invoice_number}", layout: "invoice" , disposition: 'attachment', save_to_file: File.join(Rails.root,'pdfs', "#{@transaction.invoice_number}.pdf"), save_only: false
    #     save_path = File.join(Rails.root,'pdfs', "#{@transaction.invoice_number}.pdf")
    #     File.open(save_path, 'wb') do |file|
    #       file << pdf
    #     end
    #   end
    # end
  end

  private
  def index_path
  	transactions_path
  end
end

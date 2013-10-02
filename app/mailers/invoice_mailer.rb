class InvoiceMailer < ActionMailer::Base
  default from: "admin@tripclouds.com"

  def invoice_email(transaction_id, from, to)
  	@transaction = Transaction.show(transaction_id.to_i)
  	invoice_number = @transaction.invoice_number
	mail :subject => "Invoice #{invoice_number}",
		:to      => to,
		:from    => from,
		:name	=> "Admin",
		:bcc	=> "dandy@tripclouds.com"
  end
  # handle_asynchronously :invoice_email
end

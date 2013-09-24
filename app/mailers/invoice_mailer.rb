class InvoiceMailer < ActionMailer::Base
  default from: "admin@tripclouds.com"

  def invoice_email(transaction, from, to)
  	@transaction = transaction
	mail :subject => "Invoice number #{transaction.id}",
		:to      => to,
		:from    => from,
		:bcc	=> "dandy@tripclouds.com"
  end
end

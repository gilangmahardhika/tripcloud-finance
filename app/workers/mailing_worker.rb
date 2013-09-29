class MailingWorker
	include Sidekiq::Worker

	def perform(transaction, from, to)
		InvoiceMailer.invoice_email(transaction, from, to).deliver
	end
end
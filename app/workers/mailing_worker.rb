class MailingWorker
	include Sidekiq::Worker

	def perform(transaction_id, from, to)
		InvoiceMailer.invoice_email(transaction_id, from, to).deliver
	end
end
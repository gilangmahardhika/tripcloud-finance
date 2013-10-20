class PdfExportWorker
	include Sidekiq::Worker

	def perform(transaction_id)
		transaction = Transaction.find(transaction_id)
		transaction.to_pdf if transaction
	end
end
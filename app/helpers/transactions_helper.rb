module TransactionsHelper
	def date_format(date_input)
		date_input.strftime("%d %b %Y")
	end
end

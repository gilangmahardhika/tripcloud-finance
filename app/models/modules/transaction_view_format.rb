module Modules
	module TransactionViewFormat
		include ActionView::Helpers::NumberHelper
		# def issued_date_formatted
		#   issued_date.strftime("%d %b %Y")
		# end

		# def time_limit_formatted
		#   time_limit.strftime("%d %b %Y")
		# end

		def nett_to_agent_formatted
			format_price(self.nett_to_agent)
		  # "IDR #{self.number_with_delimiter(self.nett_to_agent, delimiter: ".", separator: ",")}"
		end

		def total_price_formatted
			format_price(self.total_price)
		  # "IDR #{self.number_with_delimiter(self.total_price, delimiter: ".", separator: ",")}"
		end

		def format_price(price)
			"IDR #{self.number_with_delimiter(price, delimiter: ".", separator: ",")}"
		end

		def format_price_k(price)
			"#{self.number_with_delimiter(price.to_i / 1000, delimiter: ".", separator: ",")}K"
		end
	end
end
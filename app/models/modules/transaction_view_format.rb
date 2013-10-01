module Modules
	module TransactionViewFormat
		def issued_date_formatted
		  issued_date.strftime("%d %b %Y")
		end

		def time_limit_formatted
		  time_limit.strftime("%d %b %Y")
		end

		def nett_to_agent_formatted
		  "IDR #{self.number_with_delimiter(self.nett_to_agent, delimiter: ".", separator: ",")}"
		end

		def total_price_formatted
		  "IDR #{self.number_with_delimiter(self.total_price, delimiter: ".", separator: ",")}"
		end
	end
end
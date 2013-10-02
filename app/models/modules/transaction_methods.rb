module Modules
	module TransactionMethods
		include Modules::TransactionViewFormat
		def order_last(page = 1)
			includes(:admin_user, paxes: [:departure, :arrival, :airline]).page(page).per(15)
		end

		def show(id)
			includes(:admin_user, paxes: [:departure, :arrival, :airline]).find(id)
		end

		def all
			includes(:admin_user, paxes: [:departure, :arrival, :airline]).all
		end

		def sum_price(field)
			sum(field)
		end

		def sum_price_formatted(field)
			self.format_price(sum(field))
		end

		def sum_price_formatted_k(field)
			self.format_price_k(sum(field))
		end
	end
end
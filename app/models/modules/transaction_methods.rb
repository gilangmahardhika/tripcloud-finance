module Modules
	module TransactionMethods
		include Modules::TransactionViewFormat
		def order_last(page = 1)
			joins({paxes: :departure}, {paxes: :arrival}, {paxes: :airline}, :admin_user).page(page).per(15)
		end

		def show(id)
			joins({paxes: :departure}, {paxes: :arrival}, {paxes: :airline}, :admin_user).find(id)
		end

		def all
			joins({paxes: :departure}, {paxes: :arrival}, {paxes: :airline}, :admin_user).all
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
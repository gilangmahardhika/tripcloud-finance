module Modules
	module TransactionMethods
		def order_last(page = 1)
			joins({paxes: :departure}, {paxes: :arrival}, {paxes: :airline}, :admin_user).page(page).per(15)
		end

		def show(id)
			joins({paxes: :departure}, {paxes: :arrival}, {paxes: :airline}, :admin_user).find(id)
		end
	end
end
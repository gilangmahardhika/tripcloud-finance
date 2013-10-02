module Modules
	module PaxMethods
		def all
			includes(:departure, :arrival, :airline, transaction: [:admin_user]).all
			# joins(:departure, :arrival, :airline, {transaction: :admin_user}).all
		end

		def show(id)
			includes(:departure, :arrival, :airline, transaction: [:admin_user]).find(id)
			# joins(:departure, :arrival, :airline, {transaction: :admin_user}).find(id)
		end
	end
end
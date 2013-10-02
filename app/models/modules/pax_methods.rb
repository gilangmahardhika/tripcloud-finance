module Modules
	module PaxMethods
		def all
			joins(:departure, :arrival, :airline, {transaction: :admin_user}).all
		end

		def show(id)
			joins(:departure, :arrival, :airline, {transaction: :admin_user}).find(id)
		end
	end
end
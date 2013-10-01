class BankAccount < ActiveRecord::Base
  attr_accessible :account_name, :account_number, :bank_name

  validates_presence_of :account_name, :account_number, :branch, :bank_name
  validates_numericality_of :account_number
	validates_uniqueness_of :account_number

	def self.order_by_name
		order("bank_name asc")
	end
end

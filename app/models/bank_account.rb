class BankAccount < ActiveRecord::Base
  attr_accessible :account_name, :account_number, :bank_name
end
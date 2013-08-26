class Customer < ActiveRecord::Base
  attr_accessible :company, :division, :email, :name, :phone
end

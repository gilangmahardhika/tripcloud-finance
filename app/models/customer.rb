class Customer < ActiveRecord::Base
  attr_accessible :company, :division, :email, :name, :phone

  validates_presence_of :company, :division, :name, :email, :phone
end

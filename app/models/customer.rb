class Customer < ActiveRecord::Base
  attr_accessible :company, :division, :email, :name, :phone, :address, :title

  validates_presence_of :company, :division, :name, :email, :phone, :address, :title

  def name_with_title
  	"#{self.title}. #{self.name}"
  end
end

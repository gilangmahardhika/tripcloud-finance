class Customer < ActiveRecord::Base
  attr_accessible :company, :division, :email, :name, :phone, :address, :title, :customer_type

  validates_presence_of :name, :email, :phone, :address, :title
  validates_presence_of :company, :if => :customer_type_corporate?
  validates_presence_of :division, :if => :customer_type_corporate?
  
  def name_with_title
  	"#{self.title}. #{self.name}"
  end

  def customer_type_corporate?
  	customer_type == "Corporate"
  end

  def list_costumer_types
  	customer_type = ["Corporate", "Personal"]
  end

end

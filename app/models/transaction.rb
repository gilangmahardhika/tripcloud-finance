class Transaction < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  attr_accessible :admin_user_id, :issued_date, :time_limit, :route, :company, :total_price, :paxes_attributes, :personal, :to_name, :email, :address, :booking_code, :publish_fare, :nett_to_agent

  # belongs_to :customer
  # belongs_to :airline

  validates_presence_of :admin_user_id, :time_limit, :email, :to_name, :issued_date
  validates_presence_of :company, :unless => :personal_is_true?
 	validates_presence_of :event_name, :if => :transaction_type_corporate?
 	# belongs_to :airline
 	belongs_to :admin_user
 	# belongs_to :customer

 	has_many :paxes, class_name: "Pax", dependent: :destroy

  accepts_nested_attributes_for :paxes

  def transaction_type_corporate?
  	transaction_type == "corporate"
  end

  def personal_is_true?
  	personal == true
  end

  def issued_date_formatted
    self.issued_date.strftime("%d %b %Y")
  end

  def time_limit_formatted
    self.time_limit.strftime("%d %b %Y")
  end

  def nett_to_agent_formatted
    "IDR #{self.number_with_delimiter(self.nett_to_agent, delimiter: ".", separator: ",")}"
  end

  def publish_fare_formatted
    "IDR #{self.number_with_delimiter(self.publish_fare, delimiter: ".", separator: ",")}"
  end

end

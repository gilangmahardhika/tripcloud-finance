class Transaction < ActiveRecord::Base
  attr_accessible :admin_user_id, :airline_id, :arrival_id, :booking_code, :customer_id, :departure_id, :issued_date, :nett_to_agent, :publish_fare, :time_limit, :route, :event_name, :company, :flight_code, :total_price, :paxes_attributes

  attr_accessor :company

  belongs_to :customer
  belongs_to :airline

  validates_presence_of :admin_user_id, :booking_code, :customer_id, :time_limit

 	validates_presence_of :event_name, :if => :transaction_type_corporate?
 	belongs_to :airline
 	belongs_to :admin_user
 	belongs_to :customer

 	has_many :paxes, class_name: "Pax"

  accepts_nested_attributes_for :paxes

  def transaction_type_corporate?
  	transaction_type == "corporate"
  end

end

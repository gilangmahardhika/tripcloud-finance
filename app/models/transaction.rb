class Transaction < ActiveRecord::Base
  attr_accessible :admin_user_id, :airline_id, :arrival_id, :booking_code, :customer_id, :departure_id, :issued_date, :nett_to_agent, :publish_fare, :time_limit, :route, :event_name

  belongs_to :customer
  belongs_to :airline


  validates_presence_of :admin_user_id, :airline_id, :booking_code, :customer_id, :departure_id, :arrival_id, :issued_date, :nett_to_agent, :publish_fare, :time_limit, :event_name, :route

 	belongs_to :departure, class_name: "City"
 	belongs_to :arrival, class_name: "City"
 	belongs_to :airline
 	belongs_to :admin_user
 	belongs_to :customer

 	has_many :paxes
end

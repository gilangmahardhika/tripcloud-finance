class Transaction < ActiveRecord::Base
  attr_accessible :admin_user_id, :airline_id, :arrival_id, :booking_code, :customer_id, :departure_id, :issued_date, :nett_to_agent, :publish_fare, :time_limit

  belongs_to :customer
  belongs_to :airline


  validates_presence_of :admin_user_id, :airline_id, :booking_code, :customer_id, :departure_id, :arrival_id, :issued_date, :nett_to_agent, :publish_fare, :time_limit
end

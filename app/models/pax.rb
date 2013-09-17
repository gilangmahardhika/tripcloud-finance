class Pax < ActiveRecord::Base
  attr_accessible :first_name, :id_number, :last_name, :nett_to_agent, :phone, :publish_fare, :seat_class, :ticket_number, :title, :transaction_id, :departure_id, :arrival_id, :route, :departure_date, :arrival_date, :airline_id

  validates_presence_of :first_name, :last_name, :departure_id, :arrival_id, :nett_to_agent, :publish_fare, :route, :departure_date, :airline_id
  validates_presence_of :id_number, :if => :internation_destination?
  validates_presence_of :arrival_date, :if => :route_return?

  belongs_to :transaction
  belongs_to :airline
  belongs_to :departure, class_name: "City"
  belongs_to :arrival, class_name: "City"

  def internation_destination?
  	self.departure.country != "Indonesia" || self.arrival.country != "Indonesia"
  end

  def route_return?
  	route == "Return"
  end
end

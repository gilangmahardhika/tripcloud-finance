class Pax < ActiveRecord::Base
  attr_accessible :first_name, :id_number, :last_name, :nett_to_agent, :phone, :publish_fare, :seat_class, :ticket_number, :title, :transaction_id, :departure_id, :arrival_id, :route, :departure_date, :arrival_date, :airline_id, :middle_name, :booking_code, :publish_fare, :flight_number

  validates_presence_of :first_name, :last_name, :departure_id, :arrival_id, :route, :departure_date, :airline_id, :title
  # validates_presence_of :id_number, :if => :internation_destination?
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

  def full_name
    "#{self.title}. #{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def arrival_date_formatted
    self.arrival_date.strftime("%d %b %Y") unless self.arrival_date.nil?
  end

  def departure_date_formatted
    self.departure_date.strftime("%d %b %Y") 
  end
end

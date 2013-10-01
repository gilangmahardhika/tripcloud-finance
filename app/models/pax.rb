class Pax < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  # Constants
  TITLES = %w(Mr Mrs Ms Child Infant)
  ROUTES = ["One way", "Return"]

  attr_accessible :first_name, :id_number, :last_name, :nett_to_agent, :phone, :publish_fare, :seat_class, :ticket_number, :title, :transaction_id, :departure_id, :arrival_id, :route, :departure_date, :arrival_date, :airline_id, :middle_name, :booking_code, :flight_number

  validates_numericality_of :arrival_id, :departure_id#, :transaction_id, :airline_id

  validates_presence_of :first_name, :last_name, :departure_id, :arrival_id, :route, :departure_date, :airline_id, :title, :nett_to_agent, :publish_fare, :booking_code #, :transaction_id

  validates_presence_of :arrival_date, :if => :route_return?
  validates_inclusion_of :title, in: TITLES
  validates_inclusion_of :route, in: ROUTES

  # Associations
  belongs_to :transaction
  belongs_to :airline
  belongs_to :departure, class_name: "City"
  belongs_to :arrival, class_name: "City"

  # Callbacks
  # before_save :sum_total_price

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

  def publish_fare_formatted
    "IDR #{self.number_with_delimiter(self.publish_fare, delimiter: ".", separator: ",")}"
  end

  def total_price_formatted
    "IDR #{self.number_with_delimiter(self.publish_fare, delimiter: ".", separator: ",")}"
  end
end

class Pax < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  include Modules::PaxViewFormat
  extend Modules::PaxMethods

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

  # Delegate
  delegate :name, :code, to: :airline, prefix: true
  delegate :name, :code, to: :departure, prefix: true
  delegate :name, :code, to: :arrival, prefix: true
  

  def internation_destination?
  	self.departure.country != "Indonesia" || self.arrival.country != "Indonesia"
  end

  def route_return?
  	route == "Return"
  end 
end

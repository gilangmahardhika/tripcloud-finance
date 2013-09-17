class Pax < ActiveRecord::Base
  attr_accessible :first_name, :id_number, :last_name, :nett_to_agent, :phone, :publish_fare, :seat_class, :ticket_number, :title, :transaction_id

  validates_presence_of :first_name, :last_name

  belongs_to :transaction

  belongs_to :departure, class_name: "City"
  belongs_to :arrival, class_name: "City"
end

class City < ActiveRecord::Base
  attr_accessible :code, :name, :airport_name, :country

  # Validations
  validates_presence_of :name, :code, :country
  validates_uniqueness_of :code

  # Associations
  has_many :departures, class_name: "Pax", foreign_key: "departure_id"
  has_many :arrivals, class_name: "Pax", foreign_key: "arrival_id"
end

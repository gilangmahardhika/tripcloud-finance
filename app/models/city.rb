class City < ActiveRecord::Base
  attr_accessible :code, :name, :airport_name, :country

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code

  has_many :departures, class_name: "Transactions", foreign_key: "departure_id"
  has_many :arrivals, class_name: "Transactions", foreign_key: "arrival_id"
end

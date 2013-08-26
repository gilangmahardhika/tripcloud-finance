class Airline < ActiveRecord::Base
  attr_accessible :code, :logo, :name

  validates_presence_of :code
  validates_presence_of :name
  validates_uniqueness_of :code

  mount_uploader :logo, AirlineLogoUploader
end

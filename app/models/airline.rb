class Airline < ActiveRecord::Base
  attr_accessible :code, :logo, :name

  validates_presence_of :code
  validates_presence_of :name
  validates_uniqueness_of :code

  mount_uploader :logo, AirlineLogoUploader

  def get_logo(version)
  	self.logo.url(version)
  end
end

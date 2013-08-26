class City < ActiveRecord::Base
  attr_accessible :code, :name

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code
end

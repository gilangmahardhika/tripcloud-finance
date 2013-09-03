class AdminUser < ActiveRecord::Base
  attr_accessible :active, :email, :name, :password_digest, :phone, :role, :username, :password

  has_secure_password

  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :email
  validates_presence_of :phone
  validates_presence_of :active

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  scope :user_active, lambda { where(active: true) }
  scope :user_not_active, lambda { where(active: false) }

  def self.login(params)
    user = where{((username == params[:username]) | (email == params[:username])) & (active == true)}.first
  end
end

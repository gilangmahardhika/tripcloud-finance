class AdminUser < ActiveRecord::Base
  attr_accessible :active, :email, :name, :password_digest, :phone, :role, :username, :password, :password_confirmation, :avatar

  has_secure_password

  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_presence_of :phone
  validates_presence_of :role

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  validates_confirmation_of :password, on: :create

  mount_uploader :avatar, AvatarUploader

  scope :user_active, lambda { where(active: true) }
  scope :user_not_active, lambda { where(active: false) }

  def self.login(params)
    user = where{((username == params[:username]) | (email == params[:username])) & (active == true)}.first
  end

  def print_name
    self.name
  end

  def print_active
    if self.active == true
      '<span class="label label-success">Active</span>'.html_safe
    else
      '<span class="label label-danger">Not Active</span>'.html_safe
    end
  end
end

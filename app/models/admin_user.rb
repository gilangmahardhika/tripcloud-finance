class AdminUser < ActiveRecord::Base
  attr_accessible :active, :email, :name, :password_digest, :phone, :role, :username, :password, :password_confirmation, :avatar

  ROLES = ["admin", "finance"]

  has_secure_password

  # Associations
  has_many :transactions

  # Validation
  validates_presence_of :name, :username, :email,:phone, :active
  validates_presence_of :password, on: :create
  validates_presence_of :role
  validates_inclusion_of :role, in: ROLES
  validates_uniqueness_of :username, on: :create
  validates_uniqueness_of :email, on: :create
  validates_confirmation_of :password, on: :create

  # Uploade
  mount_uploader :avatar, AvatarUploader

  # Scope
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

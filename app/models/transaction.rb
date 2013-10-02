class Transaction < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  include Modules::TransactionViewFormat
  include Modules::HasAdminUser
  extend Modules::TransactionMethods

  AVAILABLE_DATES = ["time_limit", "issued_date"]
  AVAILABLE_PRICES = ["publish_fare", "nett_to_agent", "total_price"]

  attr_accessible :issued_date, :time_limit, :route, :company, :total_price, :paxes_attributes, :personal, :to_name, :email, :address, :booking_code, :publish_fare, :nett_to_agent

  validates_presence_of :time_limit, :email, :to_name, :issued_date#, :invoice_number, :total_price, :address
  validates_presence_of :company, :unless => :personal_is_true?
  validates_uniqueness_of :invoice_number

  # Associations
 	belongs_to :admin_user
 	has_many :paxes, class_name: "Pax", dependent: :destroy

  accepts_nested_attributes_for :paxes

  # Callbacks
  before_save :sum_total_price
  before_save :sum_nett_to_agent
  after_create :set_invoice_number

  def set_invoice_number
    self.invoice_number = "#{self.id}-TC/#{format_date_for_invoice_number}"; self.save!;
  end

  def sum_total_price
    total = 0
    self.paxes.each do |pax|
      total = total + pax.publish_fare
    end
    self.total_price = total
  end

  def sum_nett_to_agent
    total = 0
    self.paxes.each do |pax|
      total = total + pax.nett_to_agent
    end
    self.nett_to_agent = total
  end
  

  def transaction_type_corporate?
  	transaction_type == "corporate"
  end

  def personal_is_true?
  	personal == true
  end

  def format_date_for_invoice_number
    Time.now.strftime("%d/%m/%y")
  end


end

class Transaction < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  include Modules::TransactionViewFormat
  include Modules::HasAdminUser
  extend Modules::TransactionMethods
  include ActionController::Rendering

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
  before_save :create_pdf
  after_create :set_invoice_number

  # Delegate
  delegate :name, :email, :username, :id, to: :admin_user, prefix: true

  # Scope
  scope :almost_expired, lambda { where{time_limit >= Time.now}.order{[time_limit.asc]}.limit(5) }

  def set_invoice_number
    self.invoice_number = "#{self.id}-TC_#{format_date_for_invoice_number}"; self.save!;
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
    Time.now.strftime("%d-%m-%Y")
  end

  def to_pdf
    # create an instance of ActionView, so we can use the render method outside of a controller
    ActionView::Base.send(:define_method, :protect_against_forgery?) { false }
    av = ActionView::Base.new
    av.view_paths = ActionController::Base.view_paths
    pdf_html = av.render(
        template:"transactions/to_pdf.html.erb",
        layout:"layouts/invoice.html.erb",
        locals:{
          transaction: self,
          bank_accounts: BankAccount.order_by_name
        }
      )

    pdf_file = WickedPdf.new.pdf_from_string(pdf_html)

    path = File.join(Rails.root, "public", "files", "#{self.invoice_number}.pdf")
    file = File.open(path, "w+")
    file.write pdf_file.force_encoding("UTF-8")
    file.close
  end
end

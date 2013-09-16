class AddCustomerTypeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :customer_type, :string
  end
end

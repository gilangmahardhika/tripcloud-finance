class AddInvoiceNumberToTransactions < ActiveRecord::Migration
  def change
  	change_table :transactions do |t|
  		t.string :invoice_number
  	end
    add_index :transactions, :invoice_number
  end
end

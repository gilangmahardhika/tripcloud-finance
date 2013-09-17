class AddTransactionTypeToTransaction < ActiveRecord::Migration
  def change
  	change_table :transactions do |t|
  		t.string :transaction_type
  	end
    add_index :transactions, :transaction_type
  end
end

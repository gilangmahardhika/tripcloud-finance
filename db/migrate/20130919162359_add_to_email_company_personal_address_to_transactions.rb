class AddToEmailCompanyPersonalAddressToTransactions < ActiveRecord::Migration
  def change
  	change_table :transactions do |t|
  		t.string :to_name
  		t.string :email
  		t.string :company
  		t.text	 :address
  		t.boolean :personal
  	end
  	add_index :transactions, :to_name
  	add_index :transactions, :email
  end
end

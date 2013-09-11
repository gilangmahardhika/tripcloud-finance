class AddEventNameAndRouteToTransactions < ActiveRecord::Migration
  def change
  	change_table :transactions do |t|
  		t.string :event_name
  		t.string :route
  	end
  	add_index :transactions, :event_name
  end
  
end

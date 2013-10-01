class RemovedUnusedFieldsOnTransactions < ActiveRecord::Migration
  def change
  	change_table :transactions do |t|
  		t.remove :customer_id
  		t.remove :departure_id
  		t.remove :booking_code
  		t.remove :publish_fare
  		t.remove :event_name
  		t.remove :route
  		t.remove :airline_id
  		t.remove :transaction_type
  		t.remove :flight_code
  	end
  end
end

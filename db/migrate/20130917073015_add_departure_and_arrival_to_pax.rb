class AddDepartureAndArrivalToPax < ActiveRecord::Migration
  def change
  	change_table :paxes do |t|
  		t.integer :departure_id
  		t.integer :arrival_id
  	end
  end
end

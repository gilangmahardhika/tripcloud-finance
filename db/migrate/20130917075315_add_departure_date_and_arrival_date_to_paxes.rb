class AddDepartureDateAndArrivalDateToPaxes < ActiveRecord::Migration
  def change
  	change_table :paxes do |t|
  		t.datetime :departure_date
  		t.datetime :arrival_date
  	end
  end
end

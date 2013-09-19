class AddBookingCodeToPaxes < ActiveRecord::Migration
  def change
  	change_table :paxes do |t|
  		t.string :booking_code
  	end
    add_index :paxes, :booking_code
  end
end

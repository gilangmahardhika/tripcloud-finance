class AddFlightNumberToPaxes < ActiveRecord::Migration
  def change
    add_column :paxes, :flight_number, :string
  end
end

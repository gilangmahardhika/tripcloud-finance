class AddAirlineIdToPaxes < ActiveRecord::Migration
  def change
    add_column :paxes, :airline_id, :integer
  end
end

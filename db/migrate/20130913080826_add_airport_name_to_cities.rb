class AddAirportNameToCities < ActiveRecord::Migration
  def change
    add_column :cities, :airport_name, :string
  end
end

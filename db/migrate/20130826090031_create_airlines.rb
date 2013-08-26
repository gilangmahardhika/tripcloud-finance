class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :code
      t.string :logo

      t.timestamps
    end
    add_index :airlines, :name
    add_index :airlines, :code, unique: true
  end
end

class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :code

      t.timestamps
    end

    add_index :cities, :name
    add_index :cities, :code, unique: true
  end
end

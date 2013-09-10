class CreatePaxes < ActiveRecord::Migration
  def change
    create_table :paxes do |t|
      t.string :title
      t.string :first_name
      t.string :ticket_number
      t.string :phone
      t.integer :transaction_id
      t.string :last_name
      t.string :id_number
      t.string :seat_class
      t.decimal :nett_to_agent
      t.decimal :publish_fare

      t.timestamps
    end
    
    add_index :paxes, :first_name
    add_index :paxes, :last_name
    add_index :paxes, :ticket_number
    add_index :paxes, :transaction_id
    add_index :paxes, :id_number
    add_index :paxes, :seat_class
    add_index :paxes, :nett_to_agent
    add_index :paxes, :publish_fare
  end
end

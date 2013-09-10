class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.integer :departure_id
      t.integer :arrival_id
      t.string :booking_code
      t.datetime :time_limit
      t.date :issued_date
      t.integer :admin_user_id
      t.decimal :nett_to_agent
      t.decimal :publish_fare
      t.integer :airline_id

      t.timestamps


    end
    add_index :transactions,:customer_id
    add_index :transactions,:departure_id
    add_index :transactions,:arrival_id
    add_index :transactions,:booking_code
    add_index :transactions,:time_limit
    add_index :transactions,:issued_date
    add_index :transactions,:admin_user_id
    add_index :transactions,:nett_to_agent
    add_index :transactions,:publish_fare
    add_index :transactions,:airline_id
  end
end

class AddFlightCodeToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :flight_code, :string
  end
end

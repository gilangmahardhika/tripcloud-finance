class AddTotalPriceToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :total_price, :decimal
  end
end

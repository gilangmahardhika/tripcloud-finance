class AddRouteToPaxes < ActiveRecord::Migration
  def change
    add_column :paxes, :route, :string
  end
end

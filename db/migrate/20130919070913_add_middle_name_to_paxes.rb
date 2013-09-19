class AddMiddleNameToPaxes < ActiveRecord::Migration
  def change
    add_column :paxes, :middle_name, :string
  end
end

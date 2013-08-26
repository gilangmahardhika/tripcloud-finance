class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :company
      t.string :division
      t.string :phone
      t.string :email

      t.timestamps
    end

    add_index :customers, :name
    add_index :customers, :company
  end
end

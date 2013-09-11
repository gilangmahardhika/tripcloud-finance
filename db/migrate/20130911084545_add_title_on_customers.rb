class AddTitleOnCustomers < ActiveRecord::Migration
  def change
  	change_table :customers do |t|
  		t.string :title
  	end
  end
end

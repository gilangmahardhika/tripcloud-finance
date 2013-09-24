class ChangePublishFareOnPaxes < ActiveRecord::Migration
  def change
  	change_column :paxes, :publish_fare, :decimal
  end
end

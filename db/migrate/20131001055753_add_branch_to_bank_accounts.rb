class AddBranchToBankAccounts < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :branch, :string
  end
end

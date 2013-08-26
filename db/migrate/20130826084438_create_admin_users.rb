class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :role
      t.boolean :active
      t.string :password_digest
      t.string :username

      t.timestamps
    end

    add_index :admin_users, :username, unique: true
    add_index :admin_users, :email, unique: true
    add_index :admin_users, :name
  end
end

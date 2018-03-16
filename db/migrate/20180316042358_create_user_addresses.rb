class CreateUserAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_addresses do |t|
      t.integer :address_id
      t.integer :user_id

      t.timestamps
    end
  end
end

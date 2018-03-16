class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone, limit: 15
      t.string :address1
      t.string :address2
      t.string :city
      t.string :company
      t.integer :type, limit: 1

      t.timestamps
    end
  end
end

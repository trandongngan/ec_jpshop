class CreateShippings < ActiveRecord::Migration[5.1]
  def change
    create_table :shiping do |t|
      t.integer  :order_id
      t.integer  :address_id
      t.float    :cost
      t.integer  :promotion_id
      t.datetime :shipped_at

      t.integer  :deleted
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

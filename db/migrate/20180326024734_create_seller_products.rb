class CreateSellerProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :seller_products do |t|
      t.integer :seller_id
      t.integer :product_id
      t.float   :price
      t.integer :shipping_id
      t.integer :promotion_id
      t.integer :status

      t.timestamps
    end
  end
end

class CreateProductCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :product_carts do |t|

      t.timestamps
    end
  end
end

class CreateSellerOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :seller_orders do |t|
      t.integer  :seller_id, null: false
      t.integer  :product_id
      t.string   :number, limit: 35
      t.integer  :item_total
      t.integer  :amount
      t.integer  :shipping_id
      t.integer  :promotion_id

      t.string   :approver_name
      t.integer  :approver_id
      t.datetime :approved_at

      t.integer  :canceler_id
      t.datetime :canceled_at

      t.timestamps
    end
  end
end

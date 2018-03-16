class CreatePromotionRules < ActiveRecord::Migration[5.1]
  def change
    create_table :promotion_rules do |t|
      t.integer :promotion_id
      t.integer :product_group_id
      t.integer :type
      t.text    :preferences

      t.timestamps
    end
  end
end

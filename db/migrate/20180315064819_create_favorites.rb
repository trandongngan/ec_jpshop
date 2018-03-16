class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :seller_id

      t.integer :deleted
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.string :name
      t.string :code
      t.text :description
      t.datetime :expires_at
      t.datetime :starts_at

      t.timestamps
    end
  end
end

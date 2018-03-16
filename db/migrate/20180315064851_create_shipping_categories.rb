class CreateShippingCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :shipping_categories do |t|

      t.timestamps
    end
  end
end

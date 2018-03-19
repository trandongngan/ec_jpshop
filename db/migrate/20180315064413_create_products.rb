class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string   :name
      t.text     :description
      t.text     :about
      t.integer  :category_id
      t.string   :code, limit: 20
      t.datetime :available_on
      t.datetime :deleted_at
      t.integer  :promotionable

      t.string   :slug
      t.text     :meta_description
      t.string   :meta_keywords
      t.string   :meta_title
      t.datetime :timestamps

      t.integer  :page_views

      t.timestamps
    end
  end
end

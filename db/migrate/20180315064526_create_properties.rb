class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.text :name
      t.text :value

      t.timestamps
    end
  end
end

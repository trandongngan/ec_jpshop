class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   :username
      t.string   :password
      t.string   :email
      t.integer  :role
      t.text     :address
      t.string   :phone, limit: 15
      t.integer  :sign_in_count
      t.string   :last_sign_in_ip
      t.string   :current_sign_in_ip
      t.string   :authentication_token
      t.string   :reset_password_token
      t.string   :unlock_token
      t.datetime :block_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

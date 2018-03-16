# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180316042641) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone", limit: 15
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "company"
    t.integer "type", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.integer "seller_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.integer "seller_id"
    t.integer "deleted"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id"
    t.integer "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_properties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.integer "category_id"
    t.string "code", limit: 20
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.integer "promotionable"
    t.string "slug"
    t.text "meta_description"
    t.string "meta_keywords"
    t.string "meta_title"
    t.datetime "timestamps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotion_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "promotion_id"
    t.integer "product_group_id"
    t.integer "type"
    t.text "preferences"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "code"
    t.text "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "province"
    t.string "district"
    t.string "ward"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seller_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "seller_id", null: false
    t.integer "product_id"
    t.string "number", limit: 35
    t.integer "item_total"
    t.integer "amount"
    t.integer "shipping_id", null: false
    t.integer "promotion_id"
    t.string "approver_name"
    t.integer "approver_id"
    t.datetime "approved_at"
    t.integer "canceler_id"
    t.datetime "canceled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shiping", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "order_id"
    t.integer "address_id"
    t.float "cost", limit: 24
    t.integer "promotion_id"
    t.datetime "shipped_at"
    t.integer "deleted"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "address_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.integer "seller_id", null: false
    t.integer "product_id"
    t.string "number", limit: 35
    t.integer "item_total"
    t.integer "amount"
    t.integer "shipping_id", null: false
    t.integer "promotion_id"
    t.string "approver_name"
    t.integer "approver_id"
    t.datetime "approved_at"
    t.integer "canceler_id"
    t.datetime "canceled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.integer "role"
    t.text "address"
    t.string "phone", limit: 15
    t.integer "sign_in_count"
    t.string "last_sign_in_ip"
    t.string "current_sign_in_ip"
    t.string "authentication_token"
    t.string "reset_password_token"
    t.string "unlock_token"
    t.datetime "block_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

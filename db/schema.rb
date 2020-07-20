# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_20_020505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "custom_categories", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "categories_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categories_id"], name: "index_custom_categories_on_categories_id"
    t.index ["users_id"], name: "index_custom_categories_on_users_id"
  end

  create_table "friendlists", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.integer "friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_friendlists_on_users_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.integer "payment_amount"
    t.datetime "payment_date"
    t.string "reminder"
    t.datetime "expiry_date"
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "categories_id", null: false
    t.index ["categories_id"], name: "index_subscriptions_on_categories_id"
    t.index ["users_id"], name: "index_subscriptions_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.integer "mobile"
    t.boolean "registered"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "custom_categories", "categories", column: "categories_id"
  add_foreign_key "custom_categories", "users", column: "users_id"
  add_foreign_key "friendlists", "users", column: "users_id"
  add_foreign_key "subscriptions", "categories", column: "categories_id"
  add_foreign_key "subscriptions", "users", column: "users_id"
end

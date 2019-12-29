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

ActiveRecord::Schema.define(version: 2019_12_29_132708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_requests", force: :cascade do |t|
    t.bigint "manager_id"
    t.bigint "bill_id"
    t.datetime "approved_at"
    t.decimal "approved_status"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_requests_on_bill_id"
    t.index ["manager_id"], name: "index_bill_requests_on_manager_id"
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "type"
    t.decimal "amount"
    t.decimal "percent"
    t.datetime "close_at"
    t.datetime "replenishment_at"
    t.decimal "regular_replenishment_amount"
    t.date "expired_bill_at"
    t.decimal "early_closed_status"
    t.decimal "amount_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "country_id"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.text "name"
    t.text "short_code"
    t.text "phone_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_notifications", force: :cascade do |t|
    t.bigint "manager_id"
    t.bigint "bill_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_manager_notifications_on_bill_id"
    t.index ["manager_id"], name: "index_manager_notifications_on_manager_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "second_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.decimal "amount"
    t.decimal "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_transactions_on_recipient_id"
    t.index ["sender_id"], name: "index_transactions_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.integer "gender", default: 0
    t.date "birthday"
    t.boolean "is_deleted"
    t.boolean "is_blocked"
    t.text "phone"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bill_requests", "bills"
  add_foreign_key "bill_requests", "managers"
  add_foreign_key "bills", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "manager_notifications", "bills"
  add_foreign_key "manager_notifications", "managers"
  add_foreign_key "users", "cities"
end

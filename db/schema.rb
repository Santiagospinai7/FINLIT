# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_11_115550) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "account_name"
    t.string "account_type"
    t.decimal "balance"
    t.bigint "user_id", null: false
    t.integer "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "saving_goal"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "time_goal"
    t.decimal "balance"
    t.decimal "saving_goal"
    t.string "saving_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "category"
    t.integer "amount"
    t.date "date"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "operation_type"
    t.bigint "saving_id"
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["saving_id"], name: "index_transactions_on_saving_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "savings", "users"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "savings"
end

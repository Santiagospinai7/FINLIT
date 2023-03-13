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

ActiveRecord::Schema[7.0].define(version: 2023_03_13_103636) do
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
    t.bigint "icon_id", null: false
    t.index ["icon_id"], name: "index_accounts_on_icon_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "icons", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_materials", force: :cascade do |t|
    t.string "material_type"
    t.string "title"
    t.text "description"
    t.string "url"
    t.string "favourite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "topic_material_id", null: false
    t.index ["topic_material_id"], name: "index_learning_materials_on_topic_material_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "option"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.bigint "quiz_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.decimal "score"
    t.bigint "learning_material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_material_id"], name: "index_quizzes_on_learning_material_id"
  end

  create_table "saved_learning_materials", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "learning_material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_material_id"], name: "index_saved_learning_materials_on_learning_material_id"
    t.index ["user_id"], name: "index_saved_learning_materials_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "time_goal"
    t.decimal "balance"
    t.decimal "saving_goal"
    t.string "saving_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "icon_id", null: false
    t.index ["icon_id"], name: "index_savings_on_icon_id"
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "topic_materials", force: :cascade do |t|
    t.string "topic_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "category"
    t.decimal "amount"
    t.date "date"
    t.bigint "account_id"
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

  add_foreign_key "accounts", "icons"
  add_foreign_key "accounts", "users"
  add_foreign_key "learning_materials", "topic_materials"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "learning_materials"
  add_foreign_key "saved_learning_materials", "learning_materials"
  add_foreign_key "saved_learning_materials", "users"
  add_foreign_key "savings", "icons"
  add_foreign_key "savings", "users"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "savings"
end

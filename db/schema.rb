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

ActiveRecord::Schema[7.0].define(version: 2024_01_27_103430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "holds", force: :cascade do |t|
    t.bigint "user_id"
    t.string "symbol"
    t.string "coin_name"
    t.decimal "target"
    t.decimal "volume_size"
    t.decimal "volume_amount"
    t.decimal "entry_price"
    t.integer "status"
    t.decimal "take_profit"
    t.text "note"
    t.text "description"
    t.string "entry_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stoploss_frames", force: :cascade do |t|
    t.string "name"
    t.float "percentage_number"
    t.float "percentage_max"
    t.float "percentage_min"
    t.integer "transaction_type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_frames", force: :cascade do |t|
    t.string "name"
    t.string "time_code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.bigint "user_id"
    t.string "symbol"
    t.string "coin_name"
    t.decimal "target"
    t.integer "transaction_type"
    t.decimal "volume_size"
    t.decimal "volume_amount"
    t.decimal "entry_price"
    t.decimal "liquidation"
    t.decimal "margin_amount"
    t.integer "margin_type"
    t.integer "status"
    t.bigint "time_frame_id"
    t.decimal "take_profit"
    t.text "note"
    t.text "description"
    t.string "entry_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "stoploss"
    t.integer "result"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "symbol"
    t.string "coin_name"
    t.decimal "target"
    t.integer "transaction_type"
    t.decimal "volume_size"
    t.decimal "volume_amount"
    t.decimal "entry_price"
    t.decimal "liquidation"
    t.decimal "margin_amount"
    t.integer "margin_type"
    t.integer "status"
    t.bigint "time_frame_id"
    t.float "stoploss"
    t.decimal "take_profit"
    t.text "note"
    t.text "description"
    t.string "entry_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "address"
    t.string "country"
    t.string "avatar"
    t.string "selfie"
    t.integer "level"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "dob"
    t.text "description"
    t.integer "language"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "alias", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "referral_code"
    t.integer "registration_by"
    t.integer "reference_type"
    t.integer "point"
    t.integer "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "user_profiles", "users"
end

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

ActiveRecord::Schema.define(version: 2023_07_16_092514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "door_no"
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "district"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_basic_infos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "father_name"
    t.string "mother_name"
    t.integer "age"
    t.integer "gender"
    t.string "religion"
    t.string "caste"
    t.string "sub_caste"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_basic_infos_on_user_id"
  end

  create_table "user_horoscopes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "dob"
    t.datetime "time_of_birth"
    t.string "place_of_birth"
    t.string "zodiac"
    t.string "star"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_horoscopes_on_user_id"
  end

  create_table "user_occupations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "occupied"
    t.string "occupation_type"
    t.string "company_name"
    t.string "designation"
    t.string "salary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_occupations_on_user_id"
  end

  create_table "user_verifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "email_otp"
    t.datetime "expiry_time"
    t.boolean "verified", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_verifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "mobile", default: ""
    t.boolean "active", default: true
    t.string "user_id", default: "", null: false
    t.integer "role", default: 2, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "user_addresses", "users"
  add_foreign_key "user_basic_infos", "users"
  add_foreign_key "user_horoscopes", "users"
  add_foreign_key "user_occupations", "users"
  add_foreign_key "user_verifications", "users"
end

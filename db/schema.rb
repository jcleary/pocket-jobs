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

ActiveRecord::Schema.define(version: 2019_08_12_065002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_items", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bank_items_on_user_id"
  end

  create_table "job_types", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_type_id"
    t.bigint "payday_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id"
    t.index ["payday_id"], name: "index_jobs_on_payday_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "paydays", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "bank_item_id"
    t.integer "amount"
    t.index ["bank_item_id"], name: "index_paydays_on_bank_item_id"
    t.index ["user_id"], name: "index_paydays_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "child"
    t.string "name"
    t.integer "position"
    t.integer "target_jobs"
    t.integer "pre_target_point_value"
    t.integer "target_bonus"
    t.integer "post_target_point_value"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bank_items", "users"
  add_foreign_key "paydays", "bank_items"
  add_foreign_key "paydays", "users"
end

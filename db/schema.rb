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

ActiveRecord::Schema.define(version: 2020_12_06_114917) do

  create_table "charge_can_works", force: :cascade do |t|
    t.integer "charge_id"
    t.integer "item_id"
    t.float "time_required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_id"], name: "index_charge_can_works_on_charge_id"
    t.index ["item_id"], name: "index_charge_can_works_on_item_id"
  end

  create_table "charges", force: :cascade do |t|
    t.string "charge_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "production_act_on_charges", force: :cascade do |t|
    t.integer "charge_id"
    t.integer "item_id"
    t.date "start_date_of_week"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_id"], name: "index_production_act_on_charges_on_charge_id"
    t.index ["item_id"], name: "index_production_act_on_charges_on_item_id"
  end

  create_table "production_plan_on_charges", force: :cascade do |t|
    t.integer "charge_id"
    t.integer "item_id"
    t.date "start_date_of_week"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_id"], name: "index_production_plan_on_charges_on_charge_id"
    t.index ["item_id"], name: "index_production_plan_on_charges_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

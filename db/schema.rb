# encoding: UTF-8
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


ActiveRecord::Schema.define(version: 20160224194413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "measurements", force: :cascade do |t|
    t.string   "gender"
    t.float    "hips"
    t.float    "waist"
    t.float    "bust"
    t.float    "chest"
    t.float    "inseam"
    t.integer  "measurable_id"
    t.string   "measurable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "shoulders"
    t.float    "sleeve_length"
    t.float    "overall_length"
    t.string   "comment"
  end

  add_index "measurements", ["measurable_type", "measurable_id"], name: "index_measurements_on_measurable_type_and_measurable_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "subtitle"
    t.string   "size"
    t.string   "description"
    t.string   "category"
    t.string   "when_made"
    t.string   "image_url"
    t.float    "price"
    t.boolean  "active"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

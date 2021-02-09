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

ActiveRecord::Schema.define(version: 2021_02_05_004451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "zipcode"
    t.boolean "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coffee_roasts", force: :cascade do |t|
    t.bigint "coffee_company_id"
    t.string "name"
    t.string "origin"
    t.integer "elevation"
    t.boolean "fresh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_company_id"], name: "index_coffee_roasts_on_coffee_company_id"
  end

  create_table "flavors", force: :cascade do |t|
    t.string "name"
    t.boolean "in_stock"
    t.integer "flavor_rating"
    t.bigint "ice_cream_parlor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ice_cream_parlor_id"], name: "index_flavors_on_ice_cream_parlor_id"
  end

  create_table "ice_cream_parlors", force: :cascade do |t|
    t.string "name"
    t.boolean "open"
    t.integer "street_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coffee_roasts", "coffee_companies"
  add_foreign_key "flavors", "ice_cream_parlors"
end

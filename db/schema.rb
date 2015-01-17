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

ActiveRecord::Schema.define(version: 20150117203448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availability_reports", force: true do |t|
    t.integer  "number_of_beds"
    t.integer  "shelter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shelters", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "days_open"
    t.string   "hours"
    t.boolean  "children_allowed"
    t.boolean  "women_only"
    t.boolean  "med_facilities"
    t.boolean  "short_term"
    t.boolean  "long_term"
    t.boolean  "pets_allowed"
    t.string   "phone"
    t.string   "age_range"
    t.boolean  "showers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20170511003958) do

  create_table "bixis", force: :cascade do |t|
    t.integer "station_id"
    t.string "name"
    t.integer "terminalName"
    t.date "lastCommWithServer"
    t.float "latitude"
    t.float "longitude"
    t.boolean "installed"
    t.boolean "locked"
    t.date "installDate"
    t.date "removalDate"
    t.boolean "temporary"
    t.boolean "public"
    t.integer "nbBikes"
    t.integer "nbEmptyDocks"
    t.date "lastUpdateTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "distance"
  end

end

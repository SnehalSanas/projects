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

ActiveRecord::Schema.define(version: 2022_06_17_200911) do

  create_table "villa_schedules", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "villa_id", default: 0, null: false, unsigned: true
    t.boolean "availability", default: false
    t.float "price"
    t.date "booking_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_date", "villa_id"], name: "index_villa_schedules_on_booking_date_and_villa_id", unique: true
  end

  create_table "villas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0, unsigned: true
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode", limit: 15
    t.string "mobile", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_villas_on_status"
  end

end

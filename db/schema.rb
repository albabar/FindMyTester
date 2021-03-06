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

ActiveRecord::Schema.define(version: 2021_02_06_172228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bugs", force: :cascade do |t|
    t.bigint "tester_id", null: false
    t.bigint "device_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_bugs_on_device_id"
    t.index ["tester_id"], name: "index_bugs_on_tester_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["description"], name: "index_devices_on_description", unique: true
  end

  create_table "devices_testers", id: false, force: :cascade do |t|
    t.bigint "tester_id", null: false
    t.bigint "device_id", null: false
    t.index ["device_id"], name: "index_devices_testers_on_device_id"
    t.index ["tester_id"], name: "index_devices_testers_on_tester_id"
  end

  create_table "testers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.datetime "last_login"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bugs_count", default: 0
    t.index ["country"], name: "index_testers_on_country"
  end

  add_foreign_key "bugs", "devices"
  add_foreign_key "bugs", "testers"
  add_foreign_key "devices_testers", "devices"
  add_foreign_key "devices_testers", "testers"
end

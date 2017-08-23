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

ActiveRecord::Schema.define(version: 20170823112028) do

  create_table "addresses", force: :cascade do |t|
    t.string "first_line"
    t.string "second_line"
    t.string "city"
    t.string "region"
    t.string "country"
    t.string "postal_code"
    t.string "full_address"
    t.float "lng"
    t.float "lat"
    t.string "type"
    t.integer "legal_entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_entity_id"], name: "index_addresses_on_legal_entity_id"
  end

  create_table "legal_entities", force: :cascade do |t|
    t.string "lei"
    t.string "legal_name"
    t.string "business_register_entity_id"
    t.string "legal_jurisdiction"
    t.string "legal_form"
    t.string "entity_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "local_operating_units", force: :cascade do |t|
    t.string "lei"
    t.string "name"
    t.integer "record_count"
    t.string "content_data"
    t.datetime "last_attempted_download_date"
    t.datetime "last_successful_download_date"
    t.datetime "last_valid_download_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "initial_registration_date"
    t.datetime "last_update_date"
    t.string "registration_status"
    t.datetime "next_renewal_date"
    t.integer "local_operating_unit_id"
    t.string "validation_sources"
    t.integer "legal_entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_entity_id"], name: "index_registrations_on_legal_entity_id"
    t.index ["local_operating_unit_id"], name: "index_registrations_on_local_operating_unit_id"
  end

end

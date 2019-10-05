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

ActiveRecord::Schema.define(version: 2019_10_05_032808) do

# Could not dump table "cities" because of following StandardError
#   Unknown type 'real' for column 'latitude'

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "country_code", null: false
    t.integer "population", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries_languages", id: false, force: :cascade do |t|
    t.integer "country_id", null: false
    t.integer "language_id", null: false
    t.index ["country_id", "language_id"], name: "index_countries_languages_on_country_id_and_language_id"
    t.index ["language_id", "country_id"], name: "index_countries_languages_on_language_id_and_country_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

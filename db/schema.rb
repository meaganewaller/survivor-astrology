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

ActiveRecord::Schema.define(version: 2021_02_24_014233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.string "birthday"
    t.string "sun_sign"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "season_contestants", force: :cascade do |t|
    t.bigint "contestant_id", null: false
    t.bigint "season_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "place"
    t.index ["contestant_id"], name: "index_season_contestants_on_contestant_id"
    t.index ["season_id"], name: "index_season_contestants_on_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.integer "season_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "season_contestants", "contestants"
  add_foreign_key "season_contestants", "seasons"
end

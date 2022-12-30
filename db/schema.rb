# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_08_060901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.string "name"
    t.string "status", default: "not started"
    t.string "winner"
    t.text "teams"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tournament_id", null: false
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "total_played", default: 0
    t.integer "won", default: 0
    t.integer "lost", default: 0
    t.integer "for_runs", default: 0
    t.integer "against_runs", default: 0
    t.float "for_overs", default: 0.0
    t.float "against_overs", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tournament_id", null: false
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "status", default: "not started"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "matches", "tournaments"
  add_foreign_key "teams", "tournaments"
end

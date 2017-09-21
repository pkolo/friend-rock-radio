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

ActiveRecord::Schema.define(version: 20170921181405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_bands_on_location_id"
  end

  create_table "bands_tracks", id: false, force: :cascade do |t|
    t.bigint "track_id", null: false
    t.bigint "band_id", null: false
    t.index ["band_id", "track_id"], name: "index_bands_tracks_on_band_id_and_track_id"
    t.index ["track_id", "band_id"], name: "index_bands_tracks_on_track_id_and_band_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_episodes_on_show_id"
  end

  create_table "episodes_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "episode_id", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_tracks", id: false, force: :cascade do |t|
    t.bigint "track_id", null: false
    t.bigint "genre_id", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "show_id", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bands", "locations"
  add_foreign_key "episodes", "shows"
end

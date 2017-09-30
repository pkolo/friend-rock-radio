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

ActiveRecord::Schema.define(version: 20170927174503) do

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
    t.boolean "published"
    t.text "description"
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

  create_table "labels_tracks", id: false, force: :cascade do |t|
    t.bigint "track_id", null: false
    t.bigint "label_id", null: false
    t.index ["label_id", "track_id"], name: "index_labels_tracks_on_label_id_and_track_id"
    t.index ["track_id", "label_id"], name: "index_labels_tracks_on_track_id_and_label_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.integer "time_marker"
    t.bigint "episode_id"
    t.bigint "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_playlists_on_episode_id"
    t.index ["track_id"], name: "index_playlists_on_track_id"
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
    t.integer "year"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bands", "locations"
  add_foreign_key "episodes", "shows"
  add_foreign_key "playlists", "episodes"
  add_foreign_key "playlists", "tracks"
end

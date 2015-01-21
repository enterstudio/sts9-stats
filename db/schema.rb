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

ActiveRecord::Schema.define(version: 20150117171249) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "show_set_song_notes", force: true do |t|
    t.integer  "show_set_song_id"
    t.integer  "song_note_id"
    t.string   "description"
    t.integer  "related_id"
    t.string   "related_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_set_song_notes", ["related_id", "related_type"], name: "index_show_set_song_notes_on_related_id_and_related_type"
  add_index "show_set_song_notes", ["show_set_song_id"], name: "index_show_set_song_notes_on_show_set_song_id"
  add_index "show_set_song_notes", ["song_note_id"], name: "index_show_set_song_notes_on_song_note_id"

  create_table "show_set_songs", force: true do |t|
    t.integer  "show_set_id"
    t.integer  "song_id"
    t.time     "length"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_set_songs", ["show_set_id"], name: "index_show_set_songs_on_show_set_id"
  add_index "show_set_songs", ["song_id"], name: "index_show_set_songs_on_song_id"

  create_table "show_sets", force: true do |t|
    t.string   "type"
    t.integer  "show_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_sets", ["show_id"], name: "index_show_sets_on_show_id"

  create_table "shows", force: true do |t|
    t.date     "date"
    t.integer  "venue_id"
    t.text     "description"
    t.string   "link1320"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shows", ["venue_id"], name: "index_shows_on_venue_id"

  create_table "song_notes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours", force: true do |t|
    t.string   "name"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tours", ["show_id"], name: "index_tours_on_show_id"

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

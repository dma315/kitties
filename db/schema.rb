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

ActiveRecord::Schema.define(version: 20160510001624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cats", force: :cascade do |t|
    t.string   "url",            null: false
    t.string   "name"
    t.integer  "elo_score",      null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "owner_id"
    t.boolean  "terms_accepted"
    t.string   "thumbnail_url"
    t.string   "matchup_id"
  end

  add_index "cats", ["matchup_id"], name: "index_cats_on_matchup_id", using: :btree
  add_index "cats", ["owner_id"], name: "index_cats_on_owner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "token"
    t.integer  "uid",        limit: 8
    t.string   "provider"
    t.string   "image_url"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "winner_id",  null: false
    t.integer  "loser_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

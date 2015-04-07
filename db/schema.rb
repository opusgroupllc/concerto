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

ActiveRecord::Schema.define(version: 20150407131345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidate_comments", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "user_id"
    t.string   "state"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "body"
  end

  add_index "candidate_comments", ["candidate_id"], name: "index_candidate_comments_on_candidate_id", using: :btree
  add_index "candidate_comments", ["user_id"], name: "index_candidate_comments_on_user_id", using: :btree

  create_table "candidates", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "github_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "resume"
    t.string   "aasm_state"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

  add_foreign_key "candidate_comments", "candidates"
  add_foreign_key "candidate_comments", "users"
end

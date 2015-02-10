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

ActiveRecord::Schema.define(version: 20150205083057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amas", force: true do |t|
    t.string   "user_id"
    t.string   "desc"
    t.datetime "start_time"
    t.integer  "answer_count",   default: 0
    t.integer  "like_count",     default: 0
    t.integer  "question_count", default: 0
    t.string   "category",       default: "all"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mentor_url"
    t.string   "mentor_code"
    t.string   "one_liner"
    t.text     "description"
    t.string   "background"
  end

  create_table "authorizations", force: true do |t|
    t.integer "user_id"
    t.string  "uid"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "ama_id"
    t.integer  "score",        default: 0
    t.string   "comment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "voter_list",               array: true
  end

  add_index "comments", ["ancestry"], name: "index_comments_on_ancestry", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "school"
    t.string   "dream_school"
    t.integer  "timezone"
    t.string   "major"
    t.string   "profile_pic_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_url"
    t.text     "app_response"
    t.string   "role"
    t.string   "essay"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "encrypted_password",    limit: 128
    t.string   "confirmation_token",    limit: 128
    t.string   "remember_token",        limit: 128
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end

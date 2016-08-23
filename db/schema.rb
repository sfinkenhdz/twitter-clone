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

ActiveRecord::Schema.define(version: 20160822210930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "followings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "followings", ["follower_id", "followed_id"], name: "index_followings_on_follower_id_and_followed_id", using: :btree

  create_table "hashtags", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tweet_id"
    t.integer  "hashtag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["tweet_id", "hashtag_id"], name: "index_taggings_on_tweet_id_and_hashtag_id", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "content",            limit: 140, null: false
    t.integer  "retweet_count"
    t.integer  "like_count"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "tweets", ["creator_id"], name: "index_tweets_on_creator_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",              null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "full_name",          null: false
    t.string   "username",           null: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end

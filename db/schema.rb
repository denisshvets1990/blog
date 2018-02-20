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

ActiveRecord::Schema.define(version: 20180219195319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "post_estimates", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "estimate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_estimates", ["post_id"], name: "index_post_estimates_on_post_id", using: :btree

  create_table "post_ip_users", force: :cascade do |t|
    t.integer  "post_ip_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_ip_users", ["post_ip_id"], name: "index_post_ip_users_on_post_ip_id", using: :btree
  add_index "post_ip_users", ["user_id"], name: "index_post_ip_users_on_user_id", using: :btree

  create_table "post_ips", force: :cascade do |t|
    t.integer  "post_id"
    t.inet     "ip"
    t.integer  "users_count", default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "post_ips", ["post_id"], name: "index_post_ips_on_post_id", using: :btree
  add_index "post_ips", ["users_count"], name: "index_post_ips_on_users_count", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_ip_id"
    t.string   "title"
    t.text     "description"
    t.decimal  "rating",      precision: 3, scale: 2, default: 0.0
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "posts", ["post_ip_id"], name: "index_posts_on_post_ip_id", using: :btree
  add_index "posts", ["rating"], name: "index_posts_on_rating", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["login"], name: "index_users_on_login", using: :btree

end

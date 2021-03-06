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

ActiveRecord::Schema.define(version: 20170426022059) do

  create_table "comments", force: :cascade do |t|
    t.text     "message",    null: false
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "message",                            null: false
    t.integer  "user_id"
    t.integer  "school_id",                          null: false
    t.boolean  "legacy",             default: false, null: false
    t.string   "legacy_user_name"
    t.string   "legacy_fbid"
    t.integer  "legacy_numlikes",    default: 0,     null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "status",             default: 0,     null: false
    t.integer  "likes_count",        default: 0,     null: false
    t.integer  "recent_likes_count", default: 0,     null: false
    t.integer  "comments_count",     default: 0,     null: false
    t.index ["legacy_fbid"], name: "index_posts_on_legacy_fbid"
    t.index ["school_id"], name: "index_posts_on_school_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",             null: false
    t.string   "nickname",         null: false
    t.string   "email_suffix",     null: false
    t.string   "background_color"
    t.string   "text_color"
    t.integer  "seed_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email_suffix"], name: "index_schools_on_email_suffix", unique: true
    t.index ["name"], name: "index_schools_on_name", unique: true
    t.index ["nickname"], name: "index_schools_on_nickname", unique: true
    t.index ["seed_id"], name: "index_schools_on_seed_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                default: "",    null: false
    t.boolean  "admin",               default: false, null: false
    t.integer  "school_id",                           null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

end

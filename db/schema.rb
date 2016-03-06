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

ActiveRecord::Schema.define(version: 20160306071903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer  "press_id"
    t.integer  "raw_article_id"
    t.string   "title"
    t.string   "subtitle"
    t.string   "content"
    t.string   "images",         default: [],              array: true
    t.string   "link"
    t.datetime "published_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["press_id", "published_at"], name: "index_articles_on_press_id_and_published_at", using: :btree
    t.index ["published_at"], name: "index_articles_on_published_at", using: :btree
    t.index ["raw_article_id"], name: "index_articles_on_raw_article_id", using: :btree
    t.index ["title"], name: "index_articles_on_title", using: :btree
  end

  create_table "presses", force: :cascade do |t|
    t.string   "name"
    t.string   "rss_url"
    t.string   "homepage_url"
    t.string   "category"
    t.string   "content_selector"
    t.string   "title_selector"
    t.string   "subtitle_selector"
    t.string   "image_selector"
    t.string   "ad_selector"
    t.datetime "last_build_date"
    t.datetime "deleted_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["category"], name: "index_presses_on_category", using: :btree
    t.index ["name"], name: "index_presses_on_name", using: :btree
  end

  create_table "raw_articles", force: :cascade do |t|
    t.integer  "press_id",                           null: false
    t.string   "title",                              null: false
    t.string   "link",                               null: false
    t.text     "description"
    t.text     "page"
    t.integer  "page_fetch_error_count", default: 0, null: false
    t.datetime "page_fetched_at"
    t.string   "author"
    t.string   "category"
    t.datetime "date"
    t.datetime "deleted_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["link"], name: "index_raw_articles_on_link", using: :btree
    t.index ["page_fetched_at"], name: "index_raw_articles_on_page_fetched_at", using: :btree
    t.index ["press_id"], name: "index_raw_articles_on_press_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name",                                   null: false
    t.boolean  "admin",                  default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end

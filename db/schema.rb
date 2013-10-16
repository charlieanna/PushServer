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

ActiveRecord::Schema.define(version: 20130408072533) do

  create_table "apps_users", id: false, force: true do |t|
    t.integer "app_id"
    t.integer "user_id"
  end

  create_table "articles_categories", id: false, force: true do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "device_identifier"
    t.string   "registration_id"
    t.string   "device_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "to"
    t.string   "from"
    t.string   "subject"
    t.text     "body",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id"
  end

  create_table "messages_users", force: true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "jabber_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "device_identifier"
  end

end

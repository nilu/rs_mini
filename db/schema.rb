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

ActiveRecord::Schema.define(version: 20150907182249) do

  create_table "categories", force: :cascade do |t|
    t.integer "external_id", limit: 4
    t.string  "name",        limit: 255
  end

  create_table "categories_items", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 4
    t.integer "item_id",     limit: 4
  end

  create_table "items", force: :cascade do |t|
    t.integer "external_id", limit: 4
    t.string  "name",        limit: 255
  end

  create_table "items_users", id: false, force: :cascade do |t|
    t.integer "item_id", limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.integer "external_id", limit: 4
    t.string  "name",        limit: 255
  end

end

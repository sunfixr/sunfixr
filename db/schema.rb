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

ActiveRecord::Schema.define(version: 20150506163724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country_id"
    t.decimal  "latitude",         precision: 8, scale: 6
    t.decimal  "longitude",        precision: 9, scale: 6
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_installations", force: :cascade do |t|
    t.integer  "installation_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies_installations", ["company_id", "installation_id"], name: "index_by_company_installation", unique: true, using: :btree

  create_table "component_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components", force: :cascade do |t|
    t.integer  "component_type_id"
    t.integer  "company_id"
    t.string   "name"
    t.string   "part_number"
    t.string   "serial_number"
    t.text     "comments"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "description"
  end

  create_table "components_installations", id: false, force: :cascade do |t|
    t.integer "component_id",    null: false
    t.integer "installation_id", null: false
  end

  add_index "components_installations", ["component_id", "installation_id"], name: "index_by_component_installation", unique: true, using: :btree

  create_table "installation_posts", force: :cascade do |t|
    t.integer  "installation_id"
    t.integer  "post_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "installation_posts", ["installation_id", "post_id"], name: "index_installation_posts_on_installation_id_and_post_id", unique: true, using: :btree

  create_table "installations", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "slug",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "description"
    t.date     "install_date"
  end

  add_index "installations", ["slug"], name: "index_installations_on_slug", unique: true, using: :btree

  create_table "log_entries", force: :cascade do |t|
    t.integer  "installation_id", null: false
    t.string   "component_id"
    t.string   "user"
    t.text     "comments"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "installation_id"
    t.string   "subject"
    t.text     "post_text"
    t.string   "screen_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

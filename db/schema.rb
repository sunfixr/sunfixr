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

ActiveRecord::Schema.define(version: 20150712192403) do

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

  create_table "attachments", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "attachment"
    t.string   "original_filename"
    t.string   "content_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "notes"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "notes"
  end

  create_table "companies_projects", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies_projects", ["company_id", "project_id"], name: "index_by_company_projects", unique: true, using: :btree

  create_table "component_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components", force: :cascade do |t|
    t.integer  "component_type_id"
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.string   "part_number"
    t.string   "serial_number"
    t.text     "comments"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "components_projects", force: :cascade do |t|
    t.integer "component_id", null: false
    t.integer "project_id",   null: false
  end

  add_index "components_projects", ["component_id", "project_id"], name: "index_by_component_project", unique: true, using: :btree

  create_table "log_entries", force: :cascade do |t|
    t.integer  "project_id",   null: false
    t.string   "component_id"
    t.string   "user"
    t.text     "comments"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "project_pics", force: :cascade do |t|
    t.string   "project_id"
    t.string   "picture"
    t.string   "picture_id"
    t.string   "original_filename"
    t.string   "content_type"
    t.boolean  "is_profile"
    t.text     "notes"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "slug",         null: false
    t.text     "description"
    t.date     "install_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                               default: "", null: false
    t.string   "encrypted_password",                  default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_authentication_token"
    t.string   "encrypted_authentication_token_salt"
    t.string   "encrypted_authentication_token_iv"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_projects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.string  "role"
  end

  add_index "users_projects", ["user_id", "project_id"], name: "index_users_projects_on_user_id_and_project_id", unique: true, using: :btree

end

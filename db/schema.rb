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

ActiveRecord::Schema.define(version: 20160118071823) do

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id",    limit: 4
    t.string   "auditable_type",  limit: 255
    t.integer  "associated_id",   limit: 4
    t.string   "associated_type", limit: 255
    t.integer  "user_id",         limit: 4
    t.string   "user_type",       limit: 255
    t.string   "username",        limit: 255
    t.string   "action",          limit: 255
    t.text     "audited_changes", limit: 65535
    t.integer  "version",         limit: 4,     default: 0
    t.string   "comment",         limit: 255
    t.string   "remote_address",  limit: 255
    t.string   "request_uuid",    limit: 255
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.string   "kind_of",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "ancestry",   limit: 255
  end

  add_index "places", ["ancestry"], name: "index_places_on_ancestry", using: :btree

  create_table "report_variables", force: :cascade do |t|
    t.integer  "report_id",   limit: 4
    t.integer  "variable_id", limit: 4
    t.string   "type",        limit: 255
    t.string   "value",       limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "has_audio",   limit: 1,   default: false
    t.boolean  "listened",    limit: 1,   default: false
    t.string   "token",       limit: 255
  end

  add_index "report_variables", ["report_id"], name: "index_report_variables_on_report_id", using: :btree
  add_index "report_variables", ["variable_id"], name: "index_report_variables_on_variable_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.string   "phone",                limit: 255
    t.integer  "user_id",              limit: 4
    t.string   "audio_key",            limit: 255
    t.datetime "called_at"
    t.integer  "call_log_id",          limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "phone_without_prefix", limit: 255
    t.integer  "phd_id",               limit: 4
    t.integer  "od_id",                limit: 4
    t.string   "status",               limit: 255
    t.float    "duration",             limit: 24
    t.datetime "started_at"
    t.integer  "call_flow_id",         limit: 4
    t.text     "recorded_audios",      limit: 65535
    t.boolean  "has_audio",            limit: 1,     default: false
    t.boolean  "delete_status",        limit: 1,     default: false
    t.text     "call_log_answers",     limit: 65535
    t.integer  "verboice_project_id",  limit: 4
    t.boolean  "reviewed",             limit: 1,     default: false
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255,   null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id",   limit: 4
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",             limit: 255
    t.string   "name",                 limit: 255
    t.string   "password_digest",      limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "email",                limit: 255
    t.string   "phone",                limit: 255
    t.string   "role",                 limit: 255
    t.integer  "place_id",             limit: 4
    t.string   "phone_without_prefix", limit: 255
    t.integer  "phd_id_id",            limit: 4
    t.integer  "phd_id",               limit: 4
    t.integer  "od_id",                limit: 4
  end

  add_index "users", ["phd_id_id"], name: "index_users_on_phd_id_id", using: :btree
  add_index "users", ["place_id"], name: "index_users_on_place_id", using: :btree

  create_table "variables", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "description",         limit: 255
    t.integer  "verboice_id",         limit: 4
    t.string   "verboice_name",       limit: 255
    t.integer  "verboice_project_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "background_color",    limit: 255
    t.string   "text_color",          limit: 255
  end

  add_foreign_key "report_variables", "reports"
  add_foreign_key "report_variables", "variables"
  add_foreign_key "reports", "users"
  add_foreign_key "users", "places"
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_07_152510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contexts", force: :cascade do |t|
    t.string "label"
    t.string "title"
    t.string "context_type"
    t.bigint "platform_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["platform_id"], name: "index_contexts_on_platform_id"
  end

  create_table "platform_keys", force: :cascade do |t|
    t.string "name"
    t.string "deployment_id"
    t.bigint "platform_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["platform_id"], name: "index_platform_keys_on_platform_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.string "client"
    t.string "audience"
    t.text "public_key"
    t.text "private_key"
    t.text "tool_public_key"
    t.text "jwt_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resource_links", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "tool_link_url"
    t.string "login_url"
    t.string "role"
    t.bigint "platform_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "context_id"
    t.index ["context_id"], name: "index_resource_links_on_context_id"
    t.index ["platform_id"], name: "index_resource_links_on_platform_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.bigint "context_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["context_id"], name: "index_students_on_context_id"
  end

  add_foreign_key "contexts", "platforms"
  add_foreign_key "platform_keys", "platforms"
  add_foreign_key "resource_links", "contexts"
  add_foreign_key "resource_links", "platforms"
  add_foreign_key "students", "contexts"
end

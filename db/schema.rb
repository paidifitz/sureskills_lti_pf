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

ActiveRecord::Schema.define(version: 2022_02_02_100327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_foreign_key "platform_keys", "platforms"
end

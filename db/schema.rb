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

ActiveRecord::Schema.define(version: 2021_01_30_055132) do

  create_table "biers", force: :cascade do |t|
    t.string "deutsch_name"
    t.string "name"
    t.string "prozent"
    t.string "style"
    t.string "explanation"
    t.integer "region_id"
    t.string "area"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lands", force: :cascade do |t|
    t.string "land"
    t.string "deutsch_name"
    t.string "richtung"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bier_id", null: false
    t.text "content", null: false
    t.float "evaluation", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "deutsch_name"
    t.string "region"
    t.integer "land_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "password"
  end

end

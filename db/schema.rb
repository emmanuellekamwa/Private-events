# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_25_152939) do

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.datetime "date"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "invites", force: :cascade do |t|
    t.integer "invitee_id"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"invitee_id\", \"even_id\"", name: "index_invites_on_invitee_id_and_even_id", unique: true
    t.index ["event_id"], name: "index_invites_on_event_id"
    t.index ["invitee_id"], name: "index_invites_on_invitee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_token"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end

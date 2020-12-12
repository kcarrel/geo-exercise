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

ActiveRecord::Schema.define(version: 2020_12_12_232524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "geocache_objects", force: :cascade do |t|
    t.string "name"
    t.geography "coordinate", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coordinate"], name: "index_geocache_objects_on_coordinate", using: :gist
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.bigint "geocache_object_id"
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geocache_object_id"], name: "index_items_on_geocache_object_id"
  end

  add_foreign_key "items", "geocache_objects"
end

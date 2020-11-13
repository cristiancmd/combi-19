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

ActiveRecord::Schema.define(version: 2020_11_13_175109) do

  create_table "buses", force: :cascade do |t|
    t.integer "asientos"
    t.string "tipo"
    t.string "patente"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chofers", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.integer "dni"
    t.date "inicio_actividad"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities_routes", id: false, force: :cascade do |t|
    t.integer "city_id"
    t.integer "route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "initial_city_id"
    t.integer "destination_city_id"
    t.index ["destination_city_id"], name: "index_routes_on_destination_city_id"
    t.index ["initial_city_id"], name: "index_routes_on_initial_city_id"
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "horario"
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.string "chofer"
    t.integer "bus"
    t.integer "route"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.date "fecha_nacimiento"
    t.integer "tipo"
    t.integer "dni"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "routes", "cities", column: "destination_city_id"
  add_foreign_key "routes", "cities", column: "initial_city_id"
end

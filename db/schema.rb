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

ActiveRecord::Schema.define(version: 2020_07_03_231546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.date "fecha"
    t.integer "match_id"
    t.integer "establecimiento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "false"
    t.boolean "accomplished", default: false
    t.time "hora"
    t.integer "user_id"
    t.integer "wanted"
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "mensaje"
    t.integer "user_id"
    t.integer "negocio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating"
  end

  create_table "comunas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "establecimientos", force: :cascade do |t|
    t.string "nombre"
    t.string "tipo"
    t.string "descripcion"
    t.string "valoracion"
    t.integer "user_id"
    t.integer "comuna_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images"
    t.string "aceptado"
    t.string "adress"
    t.string "profile_image"
  end

  create_table "filtros", force: :cascade do |t|
    t.bigint "user_id"
    t.string "gustos"
    t.string "comuna"
    t.string "genero"
    t.integer "edad_min"
    t.integer "edad_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_filtros_on_user_id"
  end

  create_table "gustos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo"
  end

  create_table "gustos_users", id: false, force: :cascade do |t|
    t.bigint "gusto_id"
    t.bigint "user_id"
    t.index ["gusto_id"], name: "index_gustos_users_on_gusto_id"
    t.index ["user_id"], name: "index_gustos_users_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "matcher_id"
    t.integer "matched_id"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "date_of_birth"
    t.integer "age"
    t.integer "gender"
    t.string "username"
    t.text "description"
    t.integer "phone_number"
    t.integer "comuna_id"
    t.string "foto_perfil"
    t.string "role", default: "user"
    t.string "deporte"
    t.string "musica"
    t.string "comida"
    t.string "genero_pelicula"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "establecimientos"
  add_foreign_key "appointments", "matches"
  add_foreign_key "appointments", "users"
  add_foreign_key "comentarios", "establecimientos", column: "negocio_id"
  add_foreign_key "comentarios", "users"
  add_foreign_key "establecimientos", "comunas"
  add_foreign_key "establecimientos", "users"
  add_foreign_key "filtros", "users"
  add_foreign_key "matches", "users", column: "matcher_id"
  add_foreign_key "users", "comunas"
end

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

ActiveRecord::Schema.define(version: 20170417045048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "birth_year"
    t.string   "death_year",  default: " "
    t.string   "birth_place"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "full_name",   default: "first_name last_name"
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "book_id"
    t.integer "author_id"
    t.index ["author_id"], name: "index_authors_books_on_author_id", using: :btree
    t.index ["book_id"], name: "index_authors_books_on_book_id", using: :btree
  end

  create_table "awards", force: :cascade do |t|
    t.string   "award_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year_id"
    t.integer  "book_id"
    t.index ["book_id"], name: "index_awards_on_book_id", using: :btree
    t.index ["year_id"], name: "index_awards_on_year_id", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "cover",       default: "http://www.codigarysbooks.com/uploads/1/9/0/6/19065263/7887743_orig.jpg"
    t.string   "publisher"
    t.string   "description"
    t.integer  "author_id"
    t.datetime "created_at",                                                                                      null: false
    t.datetime "updated_at",                                                                                      null: false
    t.index ["author_id"], name: "index_books_on_author_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "years", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "year"
  end

  add_foreign_key "awards", "books"
  add_foreign_key "awards", "years"
end

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

ActiveRecord::Schema.define(version: 20140731164642) do

  create_table "applies", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "application_file_name"
    t.string   "application_content_type"
    t.integer  "application_file_size"
    t.datetime "application_updated_at"
    t.text     "text_before"
    t.text     "text_after"
    t.text     "link_text"
    t.text     "url"
  end

  create_table "attachments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
  end

  create_table "contacts", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "name"
  end

  create_table "curriculums", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donates", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brochure_file_name"
    t.string   "brochure_content_type"
    t.integer  "brochure_file_size"
    t.datetime "brochure_updated_at"
  end

  create_table "enrichments", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "headlines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "apply"
    t.text     "contact"
    t.text     "courses"
    t.text     "donates"
    t.text     "enrichments"
    t.text     "faqs"
    t.text     "histories"
    t.text     "media"
    t.text     "press"
    t.text     "results"
    t.text     "staffs"
    t.text     "studies"
    t.text     "volunteers"
  end

  create_table "histories", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "history_photo_file_name"
    t.string   "history_photo_content_type"
    t.integer  "history_photo_file_size"
    t.datetime "history_photo_updated_at"
  end

  create_table "home_pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.text     "text_before"
    t.text     "text_after"
    t.text     "link_text"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "press_id"
    t.integer  "apply_id"
  end

  create_table "media", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video1"
    t.string   "video2"
  end

  create_table "pictures", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "medium_id"
    t.integer  "home_page_id"
    t.integer  "course_id"
    t.integer  "enrichment_id"
    t.integer  "donate_id"
    t.integer  "gallery_id"
    t.integer  "staff_id"
    t.integer  "study_id"
    t.integer  "volunteer_id"
  end

  create_table "presses", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotations", force: true do |t|
    t.string   "quote"
    t.string   "attribution"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "result_photo_file_name"
    t.string   "result_photo_content_type"
    t.integer  "result_photo_file_size"
    t.datetime "result_photo_updated_at"
  end

  create_table "staffs", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "studies", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "volunteers", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121028170323) do

  create_table "postsurveys", :force => true do |t|
    t.integer  "school_info_id"
    t.integer  "school_id"
    t.integer  "user_id"
    t.integer  "section_1"
    t.integer  "section_2"
    t.integer  "section_3"
    t.integer  "section_4"
    t.integer  "section_5"
    t.integer  "section_6"
    t.integer  "efficacy_1"
    t.integer  "efficacy_2"
    t.integer  "efficacy_3"
    t.integer  "efficacy_4"
    t.integer  "efficacy_5"
    t.integer  "efficacy_6"
    t.integer  "efficacy_7"
    t.integer  "efficacy_8"
    t.integer  "efficacy_9"
    t.integer  "efficacy_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presurveys", :force => true do |t|
    t.integer  "school_info_id"
    t.integer  "school_id"
    t.integer  "user_id"
    t.integer  "section_1"
    t.integer  "section_2"
    t.integer  "section_3"
    t.integer  "section_4"
    t.integer  "section_5"
    t.integer  "section_6"
    t.integer  "efficacy_1"
    t.integer  "efficacy_2"
    t.integer  "efficacy_3"
    t.integer  "efficacy_4"
    t.integer  "efficacy_5"
    t.integer  "efficacy_6"
    t.integer  "efficacy_7"
    t.integer  "efficacy_8"
    t.integer  "efficacy_9"
    t.integer  "efficacy_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.string   "school_id"
    t.text     "main_title"
    t.text     "school_intro_title"
    t.text     "school_introduction"
    t.text     "eval_intro"
    t.text     "strength_weakness_title"
    t.text     "strengths"
    t.text     "weaknesses"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
  end

  create_table "school_infos", :force => true do |t|
    t.integer  "school_id"
    t.integer  "user_id"
    t.integer  "year"
    t.string   "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "county"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "static_contents", :force => true do |t|
    t.integer  "report_id"
    t.text     "intro_title"
    t.text     "introduction"
    t.text     "objectives_title"
    t.text     "objectives"
    t.text     "eval_title"
    t.text     "strength_weakness_intro"
    t.text     "strength_intro"
    t.text     "weakness_intro"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "school_id"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type"
  end

end

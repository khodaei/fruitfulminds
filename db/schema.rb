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

ActiveRecord::Schema.define(:version => 20121102344844) do

  create_table "efficacies", :id => false, :force => true do |t|
    t.integer  "postsurvey_id"
    t.integer  "part2_id"
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
    t.integer  "number_students"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_journals", :force => true do |t|
    t.integer  "school_semester_id"
    t.string   "student_name"
    t.integer  "week_num"
    t.integer  "fruit"
    t.integer  "vegetable"
    t.integer  "sugary_drink"
    t.integer  "water"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postsurveys", :force => true do |t|
    t.integer  "school_semester_id"
    t.integer  "section_1_1"
    t.integer  "section_1_2"
    t.integer  "section_2_1"
    t.integer  "section_2_2"
    t.integer  "section_2_3"
    t.integer  "section_2_4"
    t.integer  "section_3_1"
    t.integer  "section_3_2"
    t.integer  "section_3_3"
    t.integer  "section_3_4"
    t.integer  "section_3_5"
    t.integer  "section_3_6"
    t.integer  "section_4_1"
    t.integer  "section_4_2"
    t.integer  "section_4_3"
    t.integer  "section_5_1"
    t.integer  "section_5_2"
    t.integer  "section_6_1"
    t.integer  "section_6_2"
    t.integer  "section_6_3"
    t.integer  "section_6_4"
    t.integer  "number_students"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presurvey_part1s", :force => true do |t|
    t.integer  "school_semester_id"
    t.integer  "section_1_1"
    t.integer  "section_1_2"
    t.integer  "section_2_1"
    t.integer  "section_2_2"
    t.integer  "section_2_3"
    t.integer  "section_2_4"
    t.integer  "section_3_1"
    t.integer  "section_3_2"
    t.integer  "section_3_3"
    t.integer  "section_3_4"
    t.integer  "section_3_5"
    t.integer  "section_3_6"
    t.integer  "section_4_1"
    t.integer  "section_4_2"
    t.integer  "section_4_3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presurvey_part2s", :force => true do |t|
    t.integer  "school_semester_id"
    t.integer  "section_4_1"
    t.integer  "section_4_2"
    t.integer  "section_5_1"
    t.integer  "section_5_2"
    t.integer  "section_5_3"
    t.integer  "section_5_4"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string "label"
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

  create_table "school_semesters", :force => true do |t|
    t.integer "school_id"
    t.string  "name"
    t.integer "year"
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
    t.integer  "profile_id"
    t.integer  "school_semester_id"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

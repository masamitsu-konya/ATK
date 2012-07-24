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

ActiveRecord::Schema.define(:version => 20120724131043) do

  create_table "answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"

  create_table "category_of_questions", :force => true do |t|
    t.string   "category_name"
    t.string   "category_image_uid"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "picture_of_categories", :force => true do |t|
    t.integer  "category_id"
    t.binary   "picture",      :limit => 16777215
    t.string   "content_type"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "question_ratings", :force => true do |t|
    t.integer  "question_id"
    t.float    "rating"
    t.float    "rd"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "question_ratings", ["question_id"], :name => "index_question_ratings_on_question_id"

  create_table "questions", :force => true do |t|
    t.integer  "category_of_question_id"
    t.string   "question"
    t.string   "correct_answer"
    t.string   "answer_1"
    t.string   "answer_2"
    t.string   "answer_3"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "rank"
    t.boolean  "public",                  :default => false
    t.integer  "score"
    t.integer  "time"
  end

  create_table "rankings", :force => true do |t|
    t.integer  "category_of_question_id"
    t.integer  "rank"
    t.integer  "user_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer  "user_id"
    t.float    "rd"
    t.float    "score"
    t.integer  "category_of_question_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "scores", ["category_of_question_id"], :name => "index_scores_on_category_of_question_id"
  add_index "scores", ["user_id"], :name => "index_scores_on_user_id"

  create_table "user_friends", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.integer  "friend_uid", :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "user_questions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_scores", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "location"
    t.string   "company"
    t.string   "nickname"
    t.string   "email"
    t.binary   "image_url",    :limit => 16777215
    t.integer  "uid",          :limit => 8
    t.string   "access_token"
    t.string   "provider"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "nursery"
  end

end

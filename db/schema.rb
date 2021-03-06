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

ActiveRecord::Schema.define(:version => 20140225204810) do

  create_table "avatars", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.text     "signature"
    t.string   "title"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "title"
    t.integer  "old_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "last_post_date"
    t.integer  "last_post_id"
    t.integer  "reply_count"
    t.integer  "old_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "ancestry"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "user_type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "aim"
    t.date     "member_since"
    t.integer  "posts_count"
    t.boolean  "at_work"
    t.boolean  "active"
    t.integer  "messages_id"
    t.integer  "avatars_id"
    t.integer  "old_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["avatars_id"], :name => "index_users_on_avatars_id"
  add_index "users", ["messages_id"], :name => "index_users_on_messages_id"

end

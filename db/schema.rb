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

ActiveRecord::Schema.define(version: 20170616153650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string 'primary_address', default: '', null: false
    t.string 'secondary_address'
    t.string 'number'
    t.string 'zip_code', default: '', null: false
    t.string 'city', default: '', null: false
    t.string 'state', default: '', null: false
    t.string 'country', default: '', null: false
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_addresses_on_user_id'
  end

  create_table 'booklets', force: :cascade do |t|
    t.text 'title', default: '', null: false
    t.text 'description'
    t.integer 'year', null: false
    t.integer 'category', null: false
    t.string 'attachment_file_name'
    t.string 'attachment_content_type'
    t.integer 'attachment_file_size'
    t.datetime 'attachment_updated_at'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_booklets_on_user_id'
  end

  create_table 'judgements', force: :cascade do |t|
    t.text 'title', default: '', null: false
    t.date 'released_at'
    t.integer 'category', null: false
    t.string 'attachment_file_name'
    t.string 'attachment_content_type'
    t.integer 'attachment_file_size'
    t.datetime 'attachment_updated_at'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_judgements_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.text 'title', default: '', null: false
    t.text 'body', default: '', null: false
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'image_file_name'
    t.string 'image_content_type'
    t.integer 'image_file_size'
    t.datetime 'image_updated_at'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name', default: '', null: false
    t.string 'last_name'
    t.string 'cpf', default: '', null: false
    t.string 'phone', default: '', null: false
    t.integer 'gender', default: 2, null: false
    t.date 'birth_date', default: -> { "('now'::text)::date" }, null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'avatar_file_name'
    t.string 'avatar_content_type'
    t.integer 'avatar_file_size'
    t.datetime 'avatar_updated_at'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['cpf'], name: 'index_users_on_cpf', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['phone'], name: 'index_users_on_phone', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'addresses', 'users'
  add_foreign_key 'booklets', 'users'
  add_foreign_key 'judgements', 'users'
  add_foreign_key 'posts', 'users'
end

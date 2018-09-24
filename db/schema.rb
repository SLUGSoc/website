# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_180_924_093_843) do
  create_table 'codes', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'events', force: :cascade do |t|
    t.datetime 'datetime'
    t.string 'location'
    t.integer 'lan_number'
    t.string 'facebook_event_id'
    t.string 'ticket_link'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.string 'image_link'
    t.string 'description'
  end

  create_table 'game_event_relations', force: :cascade do |t|
    t.integer 'game_id'
    t.integer 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_game_event_relations_on_event_id'
    t.index ['game_id'], name: 'index_game_event_relations_on_game_id'
  end

  create_table 'games', force: :cascade do |t|
    t.string 'name'
    t.string 'link'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'members', force: :cascade do |t|
    t.string 'name'
    t.string 'alias'
    t.string 'role'
    t.string 'blurb'
    t.string 'image_link'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'platform_accounts', force: :cascade do |t|
    t.integer 'platform_id'
    t.integer 'member_id'
    t.string 'tag'
    t.string 'internal_link'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['member_id'], name: 'index_platform_accounts_on_member_id'
    t.index ['platform_id'], name: 'index_platform_accounts_on_platform_id'
  end

  create_table 'platforms', force: :cascade do |t|
    t.string 'name'
    t.string 'icon'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'releases', force: :cascade do |t|
    t.integer 'game_id'
    t.integer 'platform_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['game_id'], name: 'index_releases_on_game_id'
    t.index ['platform_id'], name: 'index_releases_on_platform_id'
  end

  create_table 'rules', force: :cascade do |t|
    t.integer 'code_id'
    t.string 'summary'
    t.string 'full'
    t.string 'icon'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['code_id'], name: 'index_rules_on_code_id'
  end

  create_table 'sponsors', force: :cascade do |t|
    t.string 'name'
    t.string 'website'
    t.string 'blurb'
    t.string 'facebook'
    t.string 'twitter'
    t.string 'image_link'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end

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

ActiveRecord::Schema.define(version: 20_190_701_043_631) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'answers', id: :serial, force: :cascade do |t|
    t.text 'body', null: false
    t.boolean 'correct', default: false
    t.integer 'question_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'badge_rules', force: :cascade do |t|
    t.string 'rule'
    t.string 'value'
    t.bigint 'badge_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['badge_id'], name: 'index_badge_rules_on_badge_id'
  end

  create_table 'badges', force: :cascade do |t|
    t.string 'title'
    t.string 'img_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', id: :serial, force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'feedbacks', force: :cascade do |t|
    t.string 'message', null: false
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_feedbacks_on_user_id'
  end

  create_table 'gists', force: :cascade do |t|
    t.bigint 'question_id'
    t.string 'url', null: false
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_gists_on_question_id'
    t.index ['user_id'], name: 'index_gists_on_user_id'
  end

  create_table 'passed_tests', id: :serial, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'test_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'current_question_id'
    t.integer 'correct_questions', default: 0
    t.integer 'current_question_number', default: 1
    t.datetime 'time_end'
    t.index ['current_question_id'], name: 'index_passed_tests_on_current_question_id'
    t.index ['test_id'], name: 'index_passed_tests_on_test_id'
    t.index ['user_id'], name: 'index_passed_tests_on_user_id'
  end

  create_table 'questions', id: :serial, force: :cascade do |t|
    t.text 'body', null: false
    t.integer 'test_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['test_id'], name: 'index_questions_on_test_id'
  end

  create_table 'tests', id: :serial, force: :cascade do |t|
    t.string 'title', null: false
    t.integer 'level', default: 0
    t.integer 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'admin_id', null: false
    t.integer 'timer'
    t.index ['admin_id'], name: 'index_tests_on_admin_id'
    t.index ['category_id'], name: 'index_tests_on_category_id'
    t.index %w[title level], name: 'index_tests_on_title_and_level', unique: true
  end

  create_table 'user_badges', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'badge_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['badge_id'], name: 'index_user_badges_on_badge_id'
    t.index ['user_id'], name: 'index_user_badges_on_user_id'
  end

  create_table 'users', id: :serial, force: :cascade do |t|
    t.string 'name', null: false
    t.string 'surname'
    t.string 'type', default: 'User', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['type'], name: 'index_users_on_type'
  end

  add_foreign_key 'answers', 'questions'
  add_foreign_key 'badge_rules', 'badges'
  add_foreign_key 'feedbacks', 'users'
  add_foreign_key 'gists', 'questions'
  add_foreign_key 'gists', 'users'
  add_foreign_key 'passed_tests', 'tests'
  add_foreign_key 'passed_tests', 'users'
  add_foreign_key 'questions', 'tests'
  add_foreign_key 'tests', 'categories'
  add_foreign_key 'user_badges', 'badges'
  add_foreign_key 'user_badges', 'users'
end

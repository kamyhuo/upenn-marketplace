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

ActiveRecord::Schema.define(version: 2018_11_18_013057) do

  create_table 'images', force: :cascade do |t|
    t.integer 'listing_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['listing_id'], name: 'index_images_on_listing_id'
  end

  create_table 'listings', force: :cascade do |t|
    t.string 'title'
    t.decimal 'price'
    t.string 'state'
    t.text 'description'
    t.integer 'shop_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'image'
    t.string 'avatar_file_name'
    t.string 'avatar_content_type'
    t.integer 'avatar_file_size'
    t.datetime 'avatar_updated_at'
    t.index ['shop_id'], name: 'index_listings_on_shop_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'address'
    t.string 'city'
    t.string 'state'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'listing_id'
    t.integer 'buyer_id'
    t.integer 'seller_id'
  end

  create_table 'shops', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'avatar_file_name'
    t.string 'avatar_content_type'
    t.integer 'avatar_file_size'
    t.datetime 'avatar_updated_at'
  end

  create_table 'shops_users', force: :cascade do |t|
    t.integer 'shop_id'
    t.integer 'user_id'
    t.index ['shop_id'], name: 'index_shops_users_on_shop_id'
    t.index ['user_id'], name: 'index_shops_users_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password_hash'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

end

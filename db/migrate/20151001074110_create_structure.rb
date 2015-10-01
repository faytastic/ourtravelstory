class CreateStructure < ActiveRecord::Migration
 def change
    create_table "attachments", force: :cascade do |t|
    t.string   "picture"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  	end

 	  add_index "attachments", ["article_id"], name: "index_attachments_on_article_id"

 	  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
 		end

  	add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  	add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  	create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  	end

  	add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  	create_table "articles", force: :cascade do |t|
    t.string 		"title"
    t.integer 	"user_id"
    t.text 			"address"
    t.text 			"content"
    t.string 		"image"
    t.string 		"plans"
    t.datetime 	"created_at", null: false
    t.datetime 	"updated_at", null: false
    end

    add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  	create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  	end

  	add_index "users", ["email"], name: "index_users_on_email", unique: true
  	add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  	
  end
end

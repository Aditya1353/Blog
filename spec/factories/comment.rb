require 'faker'

FactoryGirl.define do 
	factory :comment do
		commenter Faker::Lorem.characters(20)
		body Faker::Lorem.characters(200)
	end 
end


# Comment Model Information

#create_table "comments", force: true do |t|
#    t.string   "commenter"
#    t.text     "body"
#    t.integer  "article_id"
#    t.datetime "created_at"
#    t.datetime "updated_at"
 #   t.integer  "user_id"
 # end
 # =end
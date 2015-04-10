require 'faker'
FactoryGirl.define do 
	factory :article do 
    title Faker::Lorem.characters(30)
    text Faker::Lorem.characters(30)
    user_id 1

	end
end
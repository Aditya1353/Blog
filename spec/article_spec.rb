require 'rails_helper'
require 'faker'
require 'spec_helper'

describe Article do
	it "is valid blog" do
		FactoryGirl.create(:article).should be_valid
	end

	it "is invalid without title" do
		FactoryGirl.build(:article, title: nil).should_not be_valid
	end

	it "is invalid title " do
		FactoryGirl.build(:article, title: Faker::Lorem.characters(4)).should_not be_valid
	end

	it "has a unique title" do
     	FactoryGirl.create(:article, title: "kamran")
     	p = FactoryGirl.build(:article, title: "kamran")
     	p.valid?
    	expect(p.errors[:title]).to include("has already been taken")
   	end

	
    it "is invalid text" do
		FactoryGirl.build(:article, text: Faker::Lorem.characters(505)).should_not be_valid
	end

	it "is invalid without text" do
		FactoryGirl.build(:article, text: nil).should_not be_valid
	end


end
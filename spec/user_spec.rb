require 'rails_helper'
require 'faker'
require 'spec_helper'

describe User do
	
	it "is invalid" do
		FactoryGirl.build(:user , email: nil).should_not be_valid
	end
    
    it "has to be unique" do
    	
    	FactoryGirl.create(:user , email: "aditya.kumar@zoomcar.com")
    	p = FactoryGirl.build(:user , email: "aditya.kumar@zoomcar.com")
    	p.valid?
    	#assert_equal(p , false)
    	expect(p.errors[:email]).to include("has already been taken")
    end 

    # it "is invalid" do
    # 	FactoryGirl.build(:user, password: nil).should_not be_valid
    # end

end


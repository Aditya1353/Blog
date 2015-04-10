require 'rails_helper'
require 'faker'
require 'spec_helper'

describe Comment  do

	it "is invalid" do
		FactoryGirl.build(:comment, commenter: nil).should_not be_valid
	end
end


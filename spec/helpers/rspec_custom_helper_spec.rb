require 'spec_helper'

#note that only the methods are tested that are not directly used in tests
describe RspecCustomHelper do
  describe "#attributes_for(active_record)" do
    it "should return the attributes for the User" do
      helper.attributes_for(:user).should eq(["city", "firstname", "lastname", "street", "zipcode"])
    end
  end
end
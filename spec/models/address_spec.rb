require 'spec_helper'

describe Address do
  context "an empty address" do
    it "should be invalid" do
      address = Address.new("")
      address.valid?.should be_false
      address.should validate_presence_of :zipcode
      address.should have(2).error_on(:zipcode)
    end
  end
  
  context "valid zipcode provided" do
    it "should return the right address" do
      Address.find_area_by_zipcode("1093SR").should eq("Weesperzijde")
      Address.find_area_by_zipcode("1024BJ").should eq("Nieuwendam")
    end
  end
  
  context "invalid zipcode is provided" do
    it "should return an empty address" do
      Address.find_area_by_zipcode("1000AA").should be_empty
      Address.find_area_by_zipcode("99999AA").should be_empty
      Address.find_area_by_zipcode("test").should be_empty
    end
  end
  
  context "empty zipcode is provided" do
    it "should return an empty address" do
      Address.find_area_by_zipcode("").should be_empty
    end
  end
end

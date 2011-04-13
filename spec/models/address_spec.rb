require 'spec_helper'

describe Address do
  context "valid zipcode provided" do
    it "should return the right address" do
      Address.find_area_by_zipcode("1093SR").should eq("Weesperzijde")
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

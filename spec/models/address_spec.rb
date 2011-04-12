require 'spec_helper'

describe Address do
  context "valid zipcode provided" do
    it "should return the right address" do
      Address.address("1093SR").should eq("Weesperzijde")
    end
  end
  
  context "invalid zipcode is provided" do
    it "should return an empty address" do
      Address.address("1000AA").should be_empty
      Address.address("99999AA").should be_empty
      Address.address("test").should be_empty
    end
  end
  
  context "empty zipcode is provided" do
    it "should return an empty address" do
      Address.address("").should be_empty
    end
  end
  
end

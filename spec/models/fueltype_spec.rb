require 'spec_helper'

describe Fueltype do
  context "given an empty fueltype" do
    it "should give an invalid fueltype and not save it" do
      fueltype = Fueltype.new
      should validate_presence_of :name
      fueltype.valid?.should be_false
      fueltype.save.should be_false
    end
  end
  
  context "given an valid fueltype" do
    it "should be valid and saved" do
      fueltype = Fueltype.new @euro95.attributes
      fueltype.valid?.should be_true
      fueltype.save.should be_true
    end
  end
  
  context "given an valid fueltype" do
    it "should acts as price" do
      test_acts_as_price_methods :price_per_liter, ".", :model => @euro95
    end
  end
end
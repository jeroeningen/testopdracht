require 'spec_helper'

describe Car do
  context "given an empty car" do
    it "should return an invalid car" do
      car = Car.new
      should validate_presence_of :brand
      should validate_presence_of :cartype
      should validate_presence_of :price
      should validate_presence_of :model
      car.valid?.should be_false
      car.save.should be_false
    end
  end
  
  context "given an valid car" do
    it "should succesfully save" do
      car = Car.new @ford.attributes
      car.valid?.should be_true
      car.save.should be_true
    end
  end
  
  context "given an valid car" do
    it "should acts as price" do
      test_acts_as_price_methods :price, ",", :model => @ford
    end
  end
  
  context "when I ask for the cartypes" do
    it "should return all cartypes" do
      Car::CARTYPES.should eq(["Sedan", "Hatchback", "Stationwagon", "Offroad", "SUV", "MPV", "Coupe", "Convertible", "Sportscar", "Cross-over"])
    end
  end
end
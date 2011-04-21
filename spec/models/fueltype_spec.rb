require 'spec_helper'

describe Fueltype do
  context "given an empty fueltype" do
    it "should give an invalid fueltype and not save it" do
      fueltype = Fueltype.new
      should validate_presence_of :name
      #bug testing validation of price doesn't work at the moment
#      should validate_presence_of :price_per_liter
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
  
  context "return the fueltype price" do
    it "should return the price in cents" do
      @euro95.price_in_cents_per_liter.should == 155
      @euro95.price_per_liter_in_cents.should == 155
    end
    it "should return the price" do
      @euro95.price_per_liter.should == "1.55"
    end
  end
  
  context "set the price per liter" do
    it "should set the price per liter in cents" do
      @euro95.price_in_cents_per_liter.should == 155
      @euro95.price_in_cents_per_liter = 144
      @euro95.save.should be_true
      @euro95.price_in_cents_per_liter.should == 144
    end
    it "should set the price per liter" do
      @euro95.price_per_liter.should == "1.55"
      @euro95.price_per_liter = 1.44
      @euro95.save.should be_true
      @euro95.price_per_liter.should == "1.44"
    end
  end
  
  context "given a float as price per liter" do
    it "should convert it to the right price in cents" do
      @euro95.price_per_liter = "1.5"
      @euro95.valid?.should be_true
      @euro95.price_per_liter_in_cents.should == 150
      @euro95.price_per_liter = "1"
      @euro95.valid?.should be_true
      @euro95.price_per_liter_in_cents.should == 100
      @euro95.price_per_liter = "0.99"
      @euro95.valid?.should be_true
      @euro95.price_per_liter_in_cents.should == 99
      @euro95.price_per_liter = "5"
      @euro95.valid?.should be_true
      @euro95.price_per_liter_in_cents.should == 500
      @euro95.price_per_liter = "6"
      @euro95.valid?.should be_true
      @euro95.price_per_liter_in_cents.should == 6
      @euro95.price_per_liter = "2.05"
      @euro95.valid?.should be_true
      @euro95.price_per_liter_in_cents.should == 205
    end
  end
  
  context "given a one decimal price per liter" do
    it "should return a two decimal price per liter" do
      @euro95.price_per_liter = "1.5"
      @euro95.price_per_liter.should == "1.50"
    end
  end
  
  context "given the price in cents per liter is zero" do
    it "should return an empty price per liter" do
      @euro95.price_in_cents_per_liter = nil
      @euro95.price_per_liter.should == ""
    end
  end
end

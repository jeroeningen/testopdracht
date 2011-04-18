require 'spec_helper'

describe User do
  context "an empty user" do
    it "should be invalid and should not be saved" do
      user = User.new
      user.valid?.should be_false
      user.should have(5).errors
      should validate_presence_of :firstname
      should validate_presence_of :lastname
      should validate_presence_of :street
      should validate_presence_of :city
      should have(1).error_on(:zipcode)
      user.save.should be_false
    end
  end
  
  context "an valid zipcode" do
    it "should return no error on zipcode" do
      user = User.new(:zipcode => "1024BJ")
      user.should have(0).errors_on :zipcode
    end
  end
  
  context "an invalid zipcode" do
    it "should return an error on zipcode" do
      user = User.new(:zipcode => "12345AAA")
      user.should have(1).errors_on :zipcode
      user.zipcode = "1234AAA"      
      user.should have(1).errors_on :zipcode
      user.zipcode = "12345AA"      
      user.should have(1).errors_on :zipcode
    end
  end
  
  context "an valid user" do
    it "should save succesfully" do
      user = User.new(@jeroen.attributes)
      user.valid?.should be_true
      user.save.should be_true
    end
  end
  
  context "a user with a firstname and lastname" do
    it "should return the name and fullname" do
      user = User.new(@jeroen.attributes)
      user.name.should == "Jeroen Van Ingen"
      user.fullname.should == "Jeroen Van Ingen"
    end
  end

end

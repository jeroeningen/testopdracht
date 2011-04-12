require 'spec_helper'

describe AddressesController do
  render_views
  
  describe "GET show with zipcode" do
    it "should return the address" do
      get :show, :zipcode => "1093SR"
      should respond_with(:success)
      response.body.should =~ /Weesperzijde/
    end
  end
  
  describe "GET show without zipcode" do
    it "should return a success" do
      get :show
      should respond_with(:success)
    end
  end
end

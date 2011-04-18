require 'spec_helper'

describe LightboxSessionsController do
  describe "POST lightbox_sessions" do
    it "should respond with success and return nothing" do
      post :create
      should respond_with(:success)
      response.body.should == " "
    end
  end
end
require 'spec_helper'

describe ApplicationHelper do
  describe "#admin_routing?" do
    it "should check if user is in admin routing" do
      controller.request.path = "/admin"
      helper.admin_routing?.should be_true
    end
  end
  
  describe "#edit_or_update?" do
    it "should validate if user is in the edit or update action" do
      controller.action_name = "update"
      helper.edit_or_update?.should be_true
      controller.action_name = "edit"
      helper.edit_or_update?.should be_true
      controller.action_name = "create"
      helper.edit_or_update?.should be_false
      controller.action_name = "new"
      helper.edit_or_update?.should be_false
    end
  end
  
  describe "#current_controller" do
    it "should return the current controller" do
      controller.stub(:controller_name) {"users"}
      helper.current_controller.should == "users"
    end
  end
  
  describe "#current_controller?" do
    it "should return true if the given controller is part of the current controller" do
      controller.stub(:controller_name) {"users"}
      helper.current_controller?("/").should be_false
      helper.current_controller?("users").should be_true
      helper.current_controller?("users/1").should be_false
      helper.current_controller?("testers").should be_false
    end
  end
  
  describe "#active_link?" do
    it "should check if the given link is active" do
      controller.stub(:controller_name) {"users"}
      helper.active_link?("/").should be_empty
      helper.active_link?("test").should be_empty
      helper.active_link?("users").should_not be_empty
      helper.active_link?("user").should be_empty
    end
  end
end

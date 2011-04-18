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
      ["update", "edit"].each do |action|
        controller.action_name = action
        helper.edit_or_update?.should be_true
      end
      ["create", "new", "show", "index", "destroy"].each do |action|
        controller.action_name = action
        helper.edit_or_update?.should be_false
      end
      ["update", "edit"].each do |action|
        helper.stub("action_name").and_return(action)
        helper.edit_or_update?.should be_true
      end
      ["create", "new", "show", "index", "destroy"].each do |action|
        helper.stub("action_name").and_return(action)
        helper.edit_or_update?.should be_false
      end
    end
  end
  
  describe "creating_or_editing?" do
    it "should return true if creating or editing an object" do 
      ["create", "new", "update", "edit"].each do |action|
        controller.action_name = action
        helper.creating_or_editing?.should be_true
      end
      ["show", "index", "destroy"].each do |action|
        controller.action_name = action
        helper.creating_or_editing?.should be_false
      end
      ["create", "new", "update", "edit"].each do |action|
        helper.stub("action_name").and_return(action)
        helper.creating_or_editing?.should be_true
      end
      ["show", "index", "destroy"].each do |action|
        helper.stub("action_name").and_return(action)
        helper.creating_or_editing?.should be_false
      end
    end
  end
  
  describe "#current_controller" do
    it "should return the current controller" do
      controller.stub(:controller_name) {"users"}
      helper.current_controller.should == "users"
      helper.current_controller.should_not == "user"
      helper.current_controller.should_not == "test"
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
  
  describe "#enable_lightbox?" do
    it "should check if the session 'enable lightbox' is true" do
      helper.stub('session').and_return(:enable_lightbox => true)
      helper.enable_lightbox?.should be_true
      helper.stub('session').and_return(:enable_lightbox => "0")
      helper.enable_lightbox?.should be_false
      helper.stub('session').and_return({})
      helper.enable_lightbox?.should be_false
    end
  end

  describe "#close_lightbox?" do
    it "should check if the parameter 'close lightbox' is 1" do
      helper.stub('params').and_return(:close_lightbox => "1")
      helper.close_lightbox?.should be_true
      helper.stub('params').and_return(:close_lightbox => "0")
      helper.close_lightbox?.should be_false
      helper.stub('params').and_return({})
      helper.close_lightbox?.should be_false
    end
  end

  describe "#render_action_or_partial" do
    before(:each) {
      assign(:user, @jeroen)
      helper.stub("action_name").and_return("admin/users/show")
    }
    it "should render the action if the lightbox is disabled" do
      #unfortunaley the helper spect tests cannot renbder the action, only the partials
      helper.stub("enable_lightbox?").and_return(false)
      helper.render_action_or_partial.should =~ /Show user \'Jeroen Van Ingen/
    end
    it "should render the partial if the lightbox is enabled" do
      helper.stub("enable_lightbox?").and_return(true)
      helper.render_action_or_partial.should_not =~ /DOCTYPE/
      helper.render_action_or_partial.should =~ /Show user \'Jeroen Van Ingen/
    end
  end
  
  describe "#menuitems" do
    it "should return the menuitems" do
      helper.stub("admin_routing?").and_return(true)
      helper.menuitems.should == ["users"]
      helper.stub("admin_routing?").and_return(false)
      helper.menuitems.should == []
    end
  end
end

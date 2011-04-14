require 'spec_helper'

describe FancyboxHelper do
  describe "#close_fancybox_and_reload_page" do
    it "should close the fancybox and reload the page" do
      helper.close_fancybox_and_reload_page == "$.fancybox.close();location.reload();"
    end
  end
  
  describe "#reload_form_in_fancybox" do
    it "should reload the form in the fancybox and render the template correctly" do
      controller.stub(:controller_path) {"admin/users"}
      controller.stub(:action_name) {"edit"}
      assign(:user, @jeroen)
      helper.reload_form_in_fancybox.should_not be_empty
    end
  end
  
  describe "#link_to_fancybox" do
    it "should return a link to the fancybox" do
      helper.link_to_fancybox("users", "users").should == "<a href=\"#\" onclick=\"$.fancybox({href:'users'}); return false;\">users</a>"
    end
  end
  
  describe "#link_to_close_fancybox" do
    it "should return a link to close the fancybox" do
      helper.link_to_close_fancybox("users").should == "<a href=\"#\" onclick=\"$.fancybox.close(); return false;\">users</a>"
    end
  end
  
  describe "#button_to_close_fancybox" do
    it "should return a button to close the fancybox" do
      helper.button_to_close_fancybox("users").should == "<input onclick=\"$.fancybox.close();\" type=\"button\" value=\"users\" />"
    end
  end
end

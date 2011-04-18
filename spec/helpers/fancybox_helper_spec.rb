require 'spec_helper'

describe FancyboxHelper do
  describe "#close_fancybox_and_reload_page" do
    it "should close the fancybox and reload the page" do
      helper.close_fancybox_and_reload_page.should == "$.fancybox.close();location.reload();"
    end
  end
  
  describe "#redirect_or_close_fancybox_and_reload_page" do
    it "should redirect or close the fancybox and reload the page" do
      helper.stub("enable_lightbox?").and_return(true)
      helper.redirect_or_close_fancybox_and_reload_page.should == "$.fancybox.close();location.reload();"
      helper.stub("enable_lightbox?").and_return(false)
      helper.stub("redirect_to").and_return("/admin/users")
      helper.redirect_or_close_fancybox_and_reload_page.should == "/admin/users"
    end
  end
  
  describe "#reload_form_in_fancybox" do
    it "should reload the form in the fancybox" do
      controller.stub(:controller_path) {"admin/users"}
      controller.stub(:action_name) {"edit"}
      assign(:user, @jeroen)
      helper.reload_form_in_fancybox.should_not be_empty
    end
  end
  
  describe "#render_action_or_reload_form_in_fancybox" do
    it "should reload the form in the fancybox or render the template correctly" do
      controller.stub(:controller_path) {"admin/users"}
      controller.stub(:action_name) {"edit"}
      assign(:user, @jeroen)
      helper.stub("enable_lightbox?").and_return(true)
      helper.render_action_or_reload_form_in_fancybox.should_not be_empty
      helper.stub("enable_lightbox?").and_return(false)
      helper.render_action_or_reload_form_in_fancybox.should =~ /Editing\n'Jeroen Van Ingen'/
    end
  end
  
  describe "#link_to_fancybox" do
    it "should return a link to 'users' using the fancybox" do
      helper.link_to_fancybox("users", "users").should == "<a href=\"#\" onclick=\"link_to_fancybox_or_not('users'); return false;\">users</a>"
    end
  end
  
  describe "delete_link_to_fancybox" do
    it "should return a link to delete the user with or without using the fancybox" do
      helper.delete_link_to_fancybox("Destroy", "user").should == "<a href=\"user\" class=\"delete_link_fancybox\" data-method=\"delete\" rel=\"nofollow\">Destroy</a>"
    end
  end

  describe "#link_to_go_back" do
    it "should return a link to go back" do
      helper.link_to_go_back.should == "<a href=\"#\" onclick=\"go_back(); return false;\">Back</a>"
    end
  end
  
  describe "#button_to_close_fancybox" do
    it "should return a button to close the fancybox" do
      helper.button_to_close_fancybox("users").should == "<input onclick=\"$.fancybox.close();\" type=\"button\" value=\"users\" />"
    end
  end
end

require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the FancyboxHelper. For example:
#
# describe FancyboxHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe FancyboxHelper do
  describe "#close_fancybox_and_reload_page" do
    it "should close the fancybox and reload the page" do
      helper.close_fancybox_and_reload_page == "$.fancybox.close();location.reload();"
    end
  end
  
  describe "#link_to_fancybox" do
    it "should return a link to the fancybox" do
      helper.link_to_fancybox("test", "test").should == "<a href=\"#\" onclick=\"$.fancybox({href:'test'}); return false;\">test</a>"
    end
  end
  
  describe "#link_to_close_fancybox" do
    it "should return a link to close the fancybox" do
      helper.link_to_close_fancybox("test") == "<a href=\"#\" onclick=\"$.fancybox.close(); return false;\">test</a>"
    end
  end
  
  describe "#button_to_close_fancybox" do
    it "should return a button to close the fancybox" do
      helper.button_to_close_fancybox("test").should == "<input onclick=\"$.fancybox.close();\" type=\"button\" value=\"test\" />"
    end
  end
end

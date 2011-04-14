require 'spec_helper'

describe "admin/users/_edit" do
  it "should display the possibility to edit user Jeroen" do
    #because of a bug in Rspec, manually set the right controller action
    controller.action_name = "update"
    prepare_userviews
    rendered.should =~ /Editing\n'Jeroen Van Ingen'/
    should_contain_the_user_labels true
    rendered.should =~ /Update/
  end
end

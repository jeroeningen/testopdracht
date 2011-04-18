require 'spec_helper'

describe "admin/users/_edit" do
  it "should display the possibility to edit user Jeroen using the lightbox" do
    #because of a bug in Rspec, manually set the right controller action
    controller.action_name = "edit"
    render_userviews
    rendered.should =~ /Editing\n'Jeroen Van Ingen'/
    should_contain_the_userform_labels
    rendered.should =~ /Update/
  end
end

describe "admin/users/edit" do
  it "should display the possibility to edit user Jeroen" do
    #because of a bug in Rspec, manually set the right controller action
    controller.action_name = "edit"
    render_userviews
    rendered.should =~ /Editing\n'Jeroen Van Ingen'/
    should_contain_the_userform_labels
    rendered.should =~ /Update/
  end
end

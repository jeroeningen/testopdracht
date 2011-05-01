require 'spec_helper'

describe "admin/cars/_edit" do
  it "should display the possibility to edit car Ford" do
    #because of a bug in Rspec, manually set the right controller action
    controller.action_name = "update"
    prepare_views @ford
    rendered.should =~ /Editing\n'Ford'/
    should_contain_the_form_labels
    rendered.should =~ /Update/
  end
end

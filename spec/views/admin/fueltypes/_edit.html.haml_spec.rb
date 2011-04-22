require 'spec_helper'

describe "admin/fueltypes/_edit" do
  it "should display the possibility to edit fueltype euro95" do
    #because of a bug in Rspec, manually set the right controller action
    controller.action_name = "update"
    prepare_views @euro95
    rendered.should =~ /Editing\n'Euro 95'/
    should_contain_the_form_labels
    rendered.should =~ /Update/
  end
end

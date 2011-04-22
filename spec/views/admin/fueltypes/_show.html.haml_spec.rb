require 'spec_helper'

describe "admin/fueltypes/_show" do
  it "should display the fueltype Euro 95" do
    prepare_views @euro95
    rendered.should =~ /Euro 95/
    should_contain_the_labels
  end
end

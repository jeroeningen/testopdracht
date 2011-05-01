require 'spec_helper'

describe "admin/cars/_show" do
  it "should display the car Ford" do
    prepare_views @ford
    rendered.should =~ /Ford/
    should_contain_the_labels
  end
end

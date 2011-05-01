require 'spec_helper'

describe "admin/cars/_new" do
  it "should display the form for a new car" do
    prepare_views @ford
    rendered.should =~ /New car/
    should_contain_the_form_labels
    rendered.should =~ /Create/
  end
end

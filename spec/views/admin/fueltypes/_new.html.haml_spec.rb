require 'spec_helper'

describe "admin/fueltypes/_new" do
  it "should display the form for a new fueltype" do
    prepare_views @euro95
    rendered.should =~ /New fueltype/
    should_contain_the_form_labels
    rendered.should =~ /Create/
  end
end

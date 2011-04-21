require 'spec_helper'

describe "admin/users/_show" do
  it "should display the user Jeroen" do
    prepare_views @jeroen
    rendered.should =~ /Jeroen Van Ingen/
    should_contain_the_labels
  end
end

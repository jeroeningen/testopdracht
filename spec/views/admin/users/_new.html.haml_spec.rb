require 'spec_helper'

describe "admin/users/_new" do
  it "should display the form for a new user" do
    prepare_views @jeroen
    rendered.should =~ /New user/
    should_contain_the_form_labels
    rendered.should =~ /Create/
  end
end

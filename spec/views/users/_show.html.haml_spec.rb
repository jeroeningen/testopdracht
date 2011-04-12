require 'spec_helper'

describe "users/_show" do
  it "should display the user Jeroen" do
    prepare_userviews
    rendered.should =~ /Jeroen Van Ingen/
    should_contain_the_user_labels
  end
end

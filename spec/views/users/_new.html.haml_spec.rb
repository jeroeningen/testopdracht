require 'spec_helper'

describe "users/_new" do
  it "should display the form for a new user" do
    prepare_userviews
    rendered.should =~ /New user/
    should_contain_the_user_labels
    rendered.should =~ /Create/
  end
end

require 'spec_helper'

describe "admin/users/_new" do
  it "should display the form for a new user" do
    prepare_userviews
    rendered.should =~ /New user/
    should_contain_the_user_labels true
    rendered.should =~ /Create/
  end
end

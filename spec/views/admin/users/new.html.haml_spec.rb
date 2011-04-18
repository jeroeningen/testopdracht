require 'spec_helper'

describe "admin/users/_new" do
  it "should display the form in a lightbox for a new user" do
    render_userviews
    rendered.should =~ /New user/
    should_contain_the_userform_labels
    rendered.should =~ /Create/
  end
end
describe "admin/users/new" do
  it "should display the form for a new user" do
    render_userviews
    rendered.should =~ /New user/
    should_contain_the_userform_labels
    rendered.should =~ /Create/
  end
end

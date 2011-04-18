require 'spec_helper'

describe "admin/users/_show" do
  it "should display the user Jeroen in the lightbox" do
    render_userviews
    rendered.should =~ /Show user \'Jeroen Van Ingen\'/
    should_contain_the_user_labels
  end
end

describe "admin/users/show" do
  it "should display the user Jeroen" do
    render_userviews
    rendered.should =~ /Show user \'Jeroen Van Ingen\'/
    should_contain_the_user_labels
  end
end

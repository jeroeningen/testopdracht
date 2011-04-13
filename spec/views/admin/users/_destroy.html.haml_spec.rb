require 'spec_helper'

describe "admin/users/_destroy" do
  it "should ask to destroy the user" do
    prepare_userviews
    rendered.should =~ /Are you sure you want to delete this user?/
  end
end

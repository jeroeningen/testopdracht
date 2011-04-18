require 'spec_helper'

describe "admin/users/_destroy" do
  it "should ask to destroy the user using the lightbox" do
    render_userviews
    rendered.should =~ /Are you sure you want to delete this user?/
  end
end
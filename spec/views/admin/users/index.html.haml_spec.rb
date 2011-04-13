require 'spec_helper'

describe "admin/users/index" do
  it "should display two users (Jeroen and Rina)" do
    assign(:users, [@jeroen, @frank])
    render
    rendered.should =~ /Jeroen/
    rendered.should =~ /Listing user/
    rendered.should =~ /Frank/
  end
end

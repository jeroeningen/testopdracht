require 'spec_helper'

describe "admin/cars/index" do
  it "should display one car (Ford)" do
    assign(:cars, [@ford])
    render
    rendered.should =~ /Ford/
    rendered.should =~ /Listing car/
  end
end

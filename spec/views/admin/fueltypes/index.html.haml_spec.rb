require 'spec_helper'

describe "admin/fueltypes/index" do
  it "should display two fueltypes (Euro 95 and Euro 98)" do
    assign(:fueltypes, [@euro95, @euro98])
    render
    rendered.should =~ /Euro 95/
    rendered.should =~ /Listing fueltype/
    rendered.should =~ /Euro 98/
  end
end

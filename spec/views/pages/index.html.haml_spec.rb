require 'spec_helper'

describe "pages/index" do
  it "should return a welcome page" do
    render
    rendered.should =~ /Welcome visitor/
    rendered.should =~ /Please use the menu above to navigate through this site./
  end
end

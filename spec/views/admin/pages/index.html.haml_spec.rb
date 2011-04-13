require 'spec_helper'

describe "admin/pages/index" do
  it "should return a admin welcome page" do
    render
    rendered.should =~ /Welcome admin/
    rendered.should =~ /Please use the menu above to navigate through this site./
  end
end

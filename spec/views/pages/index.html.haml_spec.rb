require 'spec_helper'

describe "pages/index" do
  it "should return a welcome page" do
    render
    rendered.should =~ /Welcome visitor/
  end
end

require 'spec_helper'

describe PagesController do
  render_views 
  
  describe "GET index" do
    it "should return a welcome page" do
      get :index
      respond_with(:success)
      response.body.should =~ /Welcome visitor/
    end
  end
end

require 'spec_helper'

describe Admin::PagesController do
  render_views 
  
  describe "GET admin/pages/index" do
    it "should return a admin welcome page" do
      get :index
      respond_with(:success)
      response.body.should =~ /Welcome admin/
    end
  end
end

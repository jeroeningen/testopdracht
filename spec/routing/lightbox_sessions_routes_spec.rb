require "spec_helper"

describe "routes to lightbox_sessions_controller" do
  before(:each) do
    @session_id = "1"
  end

  describe "GET lightbox_sessions" do
    it "should route to lightbox_sessions" do
      {:get => lightbox_sessions_path}.should route_to(:controller => "lightbox_sessions", :action => "index")
    end
  end
  
  describe "GET lightbox_sessions/new" do
    it "should route to lightbox_sessions/new" do
      {:get => new_lightbox_session_path}.should route_to(:controller => "lightbox_sessions", :action => "new") 
    end
  end
  
  describe "POST /lightbox_sessions" do
    it "should route to POST lightbox_sessions" do
      {:post => lightbox_sessions_path}.should route_to(:controller => "lightbox_sessions", :action => "create")
    end
  end
  
  describe "GET lightbox_sessions/show/1" do
    it "should route to lightbox_sessions/show" do
      {:get => lightbox_session_path(@session_id)}.should route_to(:controller => "lightbox_sessions", :action => "show", :id => @session_id)
    end
  end
  
  describe "GET lightbox_sessions/edit/1" do
    it "should route to lightbox_sessions/edit/1" do
      {:get => edit_lightbox_session_path(@session_id)}.should route_to(:controller => "lightbox_sessions", :action => "edit", :id => @session_id)
    end
  end
  
  describe "PUT lightbox_sessions/1" do
    it "should route to update lightbox_sessions/1" do
      {:put => lightbox_session_path(@session_id)}.should route_to(:controller => "lightbox_sessions", :action => "update", :id => @session_id)
    end
  end
  
  describe "DELETE lightbox_sessions/1" do
    it "should route to DELETE lightbox_sessions/1" do
      {:delete => lightbox_session_path(@session_id)}.should route_to(:controller => "lightbox_sessions", :action => "destroy", :id => @session_id)
    end
  end
end
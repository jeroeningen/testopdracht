require "spec_helper"

describe "routes to users_controller" do
  before(:each) do
    @id = @jeroen.id.to_s
  end
  
  describe "GET users" do
    it "should route to users" do
      {:get => users_path}.should route_to(:controller => "users", :action => "index")
    end
  end
  
  describe "GET users/new" do
    it "should route to users/new" do
      {:get => new_user_path}.should route_to(:controller => "users", :action => "new") 
    end
  end
  
  describe "GET users/show/1" do
    it "should route to users/show" do
      {:get => user_path(@jeroen)}.should route_to(:controller => "users", :action => "show", :id => @id)
    end
  end
  
  describe "GET users/edit/1" do
    it "should route to users/edit/1" do
      {:get => edit_user_path(@jeroen)}.should route_to(:controller => "users", :action => "edit", :id => @id)
    end
  end
  
  describe "PUT users/1" do
    it "should route to update users/1" do
      {:put => user_path(@jeroen)}.should route_to(:controller => "users", :action => "update", :id => @id)
    end
  end
  
  describe "DELETE users/1" do
    it "should route to DELETE users/1" do
      {:delete => user_path(@jeroen)}.should route_to(:controller => "users", :action => "destroy", :id => @id)
    end
  end
  
  describe "GET user_destroy" do
    it "should route to GET user_destroy" do
      {:get => user_destroy_path(@jeroen)}.should route_to(:controller => "users", :action => "destroy", :id => @id)
    end
  end
end
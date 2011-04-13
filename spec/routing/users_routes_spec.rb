require "spec_helper"

describe "routes to admin/users_controller" do
  before(:each) do
    @id = @jeroen.id.to_s
  end
  
  describe "GET users" do
    it "should route to admin/users" do
      {:get => admin_users_path}.should route_to(:controller => "admin/users", :action => "index")
    end
  end
  
  describe "GET admin/users/new" do
    it "should route to admin/users/new" do
      {:get => new_admin_user_path}.should route_to(:controller => "admin/users", :action => "new") 
    end
  end
  
  describe "POST /admin/users" do
    it "should route to POST admin/users" do
      {:post => admin_users_path}.should route_to(:controller => "admin/users", :action => "create")
    end
  end
  
  describe "GET admin/users/show/1" do
    it "should route to admin/users/show" do
      {:get => admin_user_path(@jeroen)}.should route_to(:controller => "admin/users", :action => "show", :id => @id)
    end
  end
  
  describe "GET admin/users/edit/1" do
    it "should route to admin/users/edit/1" do
      {:get => edit_admin_user_path(@jeroen)}.should route_to(:controller => "admin/users", :action => "edit", :id => @id)
    end
  end
  
  describe "PUT admin/users/1" do
    it "should route to update admin/users/1" do
      {:put => admin_user_path(@jeroen)}.should route_to(:controller => "admin/users", :action => "update", :id => @id)
    end
  end
  
  describe "DELETE admin/users/1" do
    it "should route to DELETE admin/users/1" do
      {:delete => admin_user_path(@jeroen)}.should route_to(:controller => "admin/users", :action => "destroy", :id => @id)
    end
  end
  
  describe "GET admin/user_destroy" do
    it "should route to GET admin/user_destroy" do
      {:get => admin_user_destroy_path(@jeroen)}.should route_to(:controller => "admin/users", :action => "destroy", :id => @id)
    end
  end
end
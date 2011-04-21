require "spec_helper"

describe "routes to admin/fueltypes_controller" do
  before(:each) do
    @id = @euro95.id.to_s
  end
  
  describe "GET fueltypes" do
    it "should route to admin/fueltypes" do
      {:get => admin_fueltypes_path}.should route_to(:controller => "admin/fueltypes", :action => "index")
    end
  end
  
  describe "GET admin/fueltypes/new" do
    it "should route to admin/fueltypes/new" do
      {:get => new_admin_fueltype_path}.should route_to(:controller => "admin/fueltypes", :action => "new") 
    end
  end
  
  describe "POST /admin/fueltypes" do
    it "should route to POST admin/fueltypes" do
      {:post => admin_fueltypes_path}.should route_to(:controller => "admin/fueltypes", :action => "create")
    end
  end
  
  describe "GET admin/fueltypes/show/1" do
    it "should route to admin/fueltypes/show" do
      {:get => admin_fueltype_path(@euro95)}.should route_to(:controller => "admin/fueltypes", :action => "show", :id => @id)
    end
  end
  
  describe "GET admin/fueltypes/edit/1" do
    it "should route to admin/fueltypes/edit/1" do
      {:get => edit_admin_fueltype_path(@euro95)}.should route_to(:controller => "admin/fueltypes", :action => "edit", :id => @id)
    end
  end
  
  describe "PUT admin/fueltypes/1" do
    it "should route to update admin/fueltypes/1" do
      {:put => admin_fueltype_path(@euro95)}.should route_to(:controller => "admin/fueltypes", :action => "update", :id => @id)
    end
  end
  
  describe "DELETE admin/fueltypes/1" do
    it "should route to DELETE admin/fueltypes/1" do
      {:delete => admin_fueltype_path(@euro95)}.should route_to(:controller => "admin/fueltypes", :action => "destroy", :id => @id)
    end
  end
end
require "spec_helper"

describe "routes to admin/cars_controller" do
  before(:each) do
    @id = @ford.id.to_s
  end
  
  describe "GET cars" do
    it "should route to admin/cars" do
      {:get => admin_cars_path}.should route_to(:controller => "admin/cars", :action => "index")
    end
  end
  
  describe "GET admin/cars/new" do
    it "should route to admin/cars/new" do
      {:get => new_admin_car_path}.should route_to(:controller => "admin/cars", :action => "new") 
    end
  end
  
  describe "POST /admin/cars" do
    it "should route to POST admin/cars" do
      {:post => admin_cars_path}.should route_to(:controller => "admin/cars", :action => "create")
    end
  end
  
  describe "GET admin/cars/show/1" do
    it "should route to admin/cars/show" do
      {:get => admin_car_path(@ford)}.should route_to(:controller => "admin/cars", :action => "show", :id => @id)
    end
  end
  
  describe "GET admin/cars/edit/1" do
    it "should route to admin/cars/edit/1" do
      {:get => edit_admin_car_path(@ford)}.should route_to(:controller => "admin/cars", :action => "edit", :id => @id)
    end
  end
  
  describe "PUT admin/cars/1" do
    it "should route to update admin/cars/1" do
      {:put => admin_car_path(@ford)}.should route_to(:controller => "admin/cars", :action => "update", :id => @id)
    end
  end
  
  describe "DELETE admin/cars/1" do
    it "should route to DELETE admin/cars/1" do
      {:delete => admin_car_path(@ford)}.should route_to(:controller => "admin/cars", :action => "destroy", :id => @id)
    end
  end
end
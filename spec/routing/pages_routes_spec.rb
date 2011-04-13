require "spec_helper"

describe "routes to root" do
  describe "GET /" do
    it "should route to pages/index" do
      {:get => root_path}.should route_to(:controller => "pages", :action => "index")
    end
  end
end

describe "routes to admin_root" do
  describe "GET /admin" do
    it "should route to admin/pages/index" do
      {:get => admin_root_path}.should route_to(:controller => "admin/pages", :action => "index")
    end
  end
end
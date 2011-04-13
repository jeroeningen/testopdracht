require "spec_helper"

describe "routes to adresses_controller" do
  describe "GET address" do
    it "should route to address" do
      {:get => address_path}.should route_to(:controller => "addresses", :action => "show")
    end
  end
end
require "spec_helper"

describe "routes to root" do
  describe "GET /" do
    it "should route to pages/index" do
      {:get => root_path}.should route_to(:controller => "pages", :action => "index")
    end
  end
end
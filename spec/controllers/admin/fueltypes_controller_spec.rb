require 'spec_helper'

describe Admin::FueltypesController do
  render_views
  
  describe "GET admin/fueltypes/index" do
    it "should render the index template" do
      get :index
      should respond_with(:success)
      should assign_to :fueltypes
      should render_template(:index)
      response.body.should =~ /Listing fueltypes/
    end
  end
  
  describe "GET admin/fueltypes/show" do 
    it "should render the show template" do
      get :show, :id => 1
      should respond_with(:success)
      should assign_to(:fueltype)
      should render_template(:show)
      response.body.should =~ /Euro 95/
    end
  end
  
  describe "GET admin/fueltypes/new" do
    it "should render the new template" do
      get :new
      should respond_with(:success)
      should assign_to(:fueltype)
      should render_template(:new)
      response.body.should =~ /New fueltype/
    end
  end
  
  describe "GET admin/fueltypes/edit" do
    it "should render the edit template" do
      get :edit, :id => 1
      should respond_with(:success)
      should assign_to(:fueltype)
      should render_template(:edit)
      response.body.should =~ /Editing\n'Euro 95'/
    end
  end
  
  describe "POST with fueltype attributes" do
    it "should close the lightbox and reload the page" do
      post :create, :fueltype => @euro95.attributes
      should respond_with(:success)
      should assign_to(:fueltype)
      response_should_close_fancybox_and_reload_page
    end
  end
  
  describe "POST with invalid fueltype attributes" do
    it "should render the new template and return errors" do
      post :create
      should respond_with(:success)
      should assign_to(:fueltype)
      should render_template(:new)
      should_respond_with_errors
    end
  end
  
  describe "UPDATE with fueltype attributes" do
    it "should close the lightbox and reload the page" do
      put :update, :id => @euro95.id, :fueltype => @euro95.attributes
      should respond_with(:success)
      should assign_to(:fueltype)
      response_should_close_fancybox_and_reload_page
    end
  end
  
 describe "UPDATE with invalid fueltype attributes" do
   it "should render the edit template and return errors" do
     put :update, :id => @euro95.id, :fueltype => {:name => "", :price_in_cents_per_liter => ""}
     should respond_with(:success)
     should assign_to(:fueltype)
     should render_template(:edit)
     should_respond_with_errors
   end
 end
  
  describe "DELETE fueltype with id" do
    it "should close the lightbox and reload the page" do
      delete :destroy, :id => @euro95.id
      should assign_to(:fueltype)
      should respond_with(:redirect)
    end
  end
end

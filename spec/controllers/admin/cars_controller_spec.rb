require 'spec_helper'

describe Admin::CarsController do
  render_views
  
  describe "GET admin/cars/index" do
    it "should render the index template" do
      get :index
      should respond_with(:success)
      should assign_to :cars
      should render_template(:index)
      response.body.should =~ /Listing cars/
    end
  end
  
  describe "GET admin/cars/show" do 
    it "should render the show template" do
      get :show, :id => 1
      should respond_with(:success)
      should assign_to(:car)
      should render_template(:show)
      response.body.should =~ /Ford/
    end
  end
  
  describe "GET admin/cars/new" do
    it "should render the new template" do
      get :new
      should respond_with(:success)
      should assign_to(:car)
      should render_template(:new)
      response.body.should =~ /New car/
    end
  end
  
  describe "GET admin/cars/edit" do
    it "should render the edit template" do
      get :edit, :id => 1
      should respond_with(:success)
      should assign_to(:car)
      should render_template(:edit)
      response.body.should =~ /Editing\n'Ford'/
    end
  end
  
  describe "POST with car attributes" do
    it "should close the lightbox and reload the page" do
      post :create, :car => @ford.attributes
      should respond_with(:success)
      should assign_to(:car)
      response_should_close_fancybox_and_reload_page
    end
  end
  
  describe "POST with invalid car attributes" do
    it "should render the new template and return errors" do
      post :create
      should respond_with(:success)
      should assign_to(:car)
      should render_template(:new)
      should_respond_with_errors
    end
  end
  
  describe "UPDATE with car attributes" do
    it "should close the lightbox and reload the page" do
      put :update, :id => @ford.id, :car => @ford.attributes
      should respond_with(:success)
      should assign_to(:car)
      response_should_close_fancybox_and_reload_page
    end
  end
  
 describe "UPDATE with invalid car attributes" do
   it "should render the edit template and return errors" do
     put :update, :id => @ford.id, :car => {:brand => "", :price_in_cents => ""}
     should respond_with(:success)
     should assign_to(:car)
     should render_template(:edit)
     should_respond_with_errors
   end
 end
  
  describe "DELETE car with id" do
    it "should close the lightbox and reload the page" do
      delete :destroy, :id => @ford.id
      should assign_to(:car)
      should respond_with(:redirect)
    end
  end
end

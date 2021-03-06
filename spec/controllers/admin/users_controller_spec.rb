require 'spec_helper'

describe Admin::UsersController do
  render_views
  
  describe "GET admin/users/index" do
    it "should render the index template" do
      get :index
      should respond_with(:success)
      should assign_to :users
      should render_template(:index)
      response.body.should =~ /Listing users/
    end
  end
  
  describe "GET admin/users/show" do 
    it "should render the show template" do
      get :show, :id => 1
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:show)
      response.body.should =~ /Jeroen/
    end
  end
  
  describe "GET admin/users/new" do
    it "should render the new template" do
      get :new
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:new)
      response.body.should =~ /New user/
    end
  end
  
  describe "GET admin/users/edit" do
    it "should render the edit template" do
      get :edit, :id => 1
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:edit)
      response.body.should =~ /Editing\n'Jeroen Van Ingen'/
    end
  end
  
  describe "POST with user attributes" do
    it "should close the lightbox and reload the page" do
      post :create, :user => @frank.attributes
      should respond_with(:success)
      should assign_to(:user)
      response_should_close_fancybox_and_reload_page
    end
  end
  
  describe "POST with invalid user attributes" do
    it "should render the new template and return errors" do
      post :create
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:new)
      should_respond_with_errors
    end
  end
  
  describe "UPDATE with user attributes" do
    it "should close the lightbox and reload the page" do
      put :update, :id => @jeroen.id, :user => @jeroen.attributes
      should respond_with(:success)
      should assign_to(:user)
      response_should_close_fancybox_and_reload_page
    end
  end
  
 describe "UPDATE with invalid user attributes" do
   it "should render the edit template and return errors" do
     put :update, :id => @jeroen.id, :user => {:firstname => "", :lastname => ""}
     should respond_with(:success)
     should assign_to(:user)
     should render_template(:edit)
     should_respond_with_errors
   end
 end
  
  describe "DELETE user with id" do
    it "should close the lightbox and reload the page" do
      delete :destroy, :id => @jeroen.id
      should assign_to(:user)
      should respond_with(:redirect)
    end
  end
end

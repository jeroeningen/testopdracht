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
      should_render_full_html
      response.body.should =~ /Show user \'Jeroen Van Ingen'/
    end
  end
  
  describe "GET admin/users/_show" do 
    it "should render the show template in the lightbox" do
      controller.stub("enable_lightbox?").and_return(true)
      get :show, :id => 1
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:show)
      should_render_partial
      response.body.should =~ /Show user \'Jeroen Van Ingen'/
    end
  end
  
  describe "GET admin/users/new" do
    it "should render the new template" do
      get :new
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:new)
      should_render_full_html
      response.body.should =~ /New user/
    end
  end
  
  describe "GET admin/users/_new" do
    it "should render the new template in the lightbox" do
      controller.stub("enable_lightbox?").and_return(true)
      get :new
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:new)
      should_render_partial
      response.body.should =~ /New user/
    end
  end
  
  describe "GET admin/users/edit" do
    it "should render the edit template" do
      get :edit, :id => 1
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:edit)
      should_render_full_html
      response.body.should =~ /Editing\n'Jeroen Van Ingen'/
    end
  end
  
  describe "GET admin/users/_edit" do
    it "should render the edit template in the lightbox" do
      controller.stub("enable_lightbox?").and_return(true)
      get :edit, :id => 1
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:edit)
      should_render_partial
      response.body.should =~ /Editing\n'Jeroen Van Ingen'/
    end
  end
  
  describe "POST with user attributes and enable the lightbox" do
    it "should close the fancybox and reload the page" do
      controller.stub("enable_lightbox?").and_return(true)
      post :create, :user => @frank.attributes
      should respond_with(:success)
      should assign_to(:user)
      response_should_close_fancybox_and_reload_page
    end
  end
  
  describe "POST with user attributes" do
    it "should redirect" do
      controller.stub("enable_lightbox?").and_return(false)
      post :create, :user => @frank.attributes
      should respond_with(:redirect)
      should assign_to(:user)
      response.body.should =~ /You are being /
    end
  end
  
  describe "POST with invalid user attributes and enable the lightbox" do
    it "should render the new template and return errors" do
      controller.stub("enable_lightbox?").and_return(true)
      post :create
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:new)
      should_respond_with_errors
    end
  end
  
  describe "POST with invalid user attributes" do
    it "should render the new template and return errors" do
      controller.stub("enable_lightbox?").and_return(false)
      post :create
      should respond_with(:success)
      should assign_to(:user)
      should render_template(:new)
      should_respond_with_errors
    end
  end
  
  describe "UPDATE with user attributes" do
    it "should close the fancybox and reload the page" do
      controller.stub("enable_lightbox?").and_return(true)
      put :update, :id => @jeroen.id, :user => @jeroen.attributes, :enable_lightbox => "1"
      should respond_with(:success)
      should assign_to(:user)
      response_should_close_fancybox_and_reload_page
    end
  end
  
  describe "UPDATE with user attributes" do
    it "should redirect" do
      put :update, :id => @jeroen.id, :user => @jeroen.attributes
      should respond_with(:redirect)
      should assign_to(:user)
      response.body.should =~ /You are being /
    end
  end
  
 describe "UPDATE with invalid user attributes" do
   it "should render the edit partial and return errors" do
     controller.stub("enable_lightbox?").and_return(true)
     put :update, :id => @jeroen.id, :user => {:firstname => "", :lastname => ""}, :enable_lightbox => "1"
     should respond_with(:success)
     should assign_to(:user)
     should render_template(:edit)
     should_respond_with_errors
   end
 end
 
 describe "UPDATE with invalid user attributes" do
   it "should render the edit action and return errors" do
     controller.stub("enable_lightbox?").and_return(false)
     put :update, :id => @jeroen.id, :user => {:firstname => "", :lastname => ""}
     should respond_with(:success)
     should assign_to(:user)
     should render_template(:edit)
     should_respond_with_errors
   end
 end
 
 describe "DELETE admin/users/destroy/1" do
   it "should redirect" do
     delete :destroy, :id => @jeroen.id
     should assign_to(:user)
     should respond_with(:redirect)
     response.body.should =~ /You are being /
   end
 end
 
 describe "DELETE admin/users/destroy/1?close_lightbox=1" do
    it "should close the lightbox and reload the page" do
      delete :destroy, :id => @jeroen.id, :close_lightbox => "1"
      should respond_with(:success)
      should assign_to(:user)
      response_should_close_fancybox_and_reload_page
    end
  end
  
  describe "DELETE admin/users/destroy/1" do
    it "should return the destroy template in the lightbox" do
      controller.stub("params").and_return({:enable_lightbox => "1"})
      delete :destroy, :id => @jeroen.id
      should assign_to(:user)
      should respond_with(:success)
      should render_template(:destroy)
      should_render_partial
      response.body.should =~ /Are you sure you want to delete this user?/
    end
  end
end

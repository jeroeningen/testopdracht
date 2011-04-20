#users controller
class Admin::UsersController < InheritedResources::Base

  include UsersHelper
  include FancyboxHelper

  actions :index

  before_filter :load_user, :only => [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    render :partial => "new"
  end

  def show
    render :partial => "show"
  end

  def edit
    render :partial => "edit"
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      close_fancybox_and_reload_page
    else
      reload_form_in_fancybox
    end
  end

  def update
    if @user.update_attributes(params[:user])
      close_fancybox_and_reload_page
    else
      reload_form_in_fancybox
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def load_user
    @user = User.find params[:id]
  end
end
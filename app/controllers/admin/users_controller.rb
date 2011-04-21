#users controller
class Admin::UsersController < InheritedResources::Base

  include UsersHelper

  actions :index, :destroy

  before_filter :load_user, :only => [:show, :edit, :update]

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

  private

  def load_user
    @user = User.find params[:id]
  end
end
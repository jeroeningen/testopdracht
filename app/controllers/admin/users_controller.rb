#users controller
class Admin::UsersController < InheritedResources::Base

  include UsersHelper
  include FancyboxHelper

  actions :index

  before_filter :load_user, :only => [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    render_action_or_partial
  end

  def show
    render_action_or_partial
  end

  def edit
    render_action_or_partial
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_or_close_fancybox_and_reload_page
    else
      render_action_or_reload_form_in_fancybox
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_or_close_fancybox_and_reload_page
    else
      render_action_or_reload_form_in_fancybox
    end
  end

  def destroy
    #because of a bug, manually enable the lightbox
    if params[:enable_lightbox] == "1"
      render :partial => "destroy"
    else
      @user.destroy
      close_lightbox? ? close_fancybox_and_reload_page : redirect_to(admin_users_path)
    end
  end

  private

  def load_user
    @user = User.find params[:id]
  end
end
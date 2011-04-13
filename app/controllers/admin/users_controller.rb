class Admin::UsersController < InheritedResources::Base
  
  include UsersHelper
  include FancyboxHelper
  
  actions :index
  
  def new
    @user = User.new
    render :partial => "new"
  end

  def show
    @user = User.find params[:id]
    render :partial => "show"
  end
  
  def edit
    @user = User.find params[:id]
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
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      close_fancybox_and_reload_page
    else
      reload_form_in_fancybox
    end
  end

  def destroy
    @user = User.find(params[:id])
    if request.delete?
      @user.destroy
      close_fancybox_and_reload_page
    else
      render :partial => "destroy"
    end
  end

end

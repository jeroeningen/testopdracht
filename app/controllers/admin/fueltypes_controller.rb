class Admin::FueltypesController < InheritedResources::Base
  actions :index, :destroy
  before_filter :load_fueltype, :only => [:show, :edit, :update]

  def new
    @fueltype = Fueltype.new
    render :partial => "new"
  end

  def create
    @fueltype = Fueltype.new params[:fueltype]
    if @fueltype.save
      close_fancybox_and_reload_page
    else
      reload_form_in_fancybox
    end
  end

  def show
    render :partial => "show"
  end

  def edit
    render :partial => "edit"
  end

  def update
    if @fueltype.update_attributes params[:fueltype]
      close_fancybox_and_reload_page
    else
      reload_form_in_fancybox
    end
  end

  private

  def load_fueltype
    @fueltype = Fueltype.find params[:id]
  end
end
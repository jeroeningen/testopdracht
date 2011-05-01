#cars_controller
#cars_controller
class Admin::CarsController < InheritedResources::Base
  actions :all, :except => [:new, :create, :edit, :update]
  before_filter :load_car, :only => [:show, :edit, :update]

  def new
    @car = Car.new
    render :partial => "new"
  end

  def create
    @car = Car.new params[:car]
    if @car.save
      close_fancybox_and_reload_page
    else
      reload_form_in_fancybox
    end
  end

  def edit
    render :partial => "edit"
  end

  def show
    render :partial => "show"
  end

  def update
    if @car.update_attributes params[:car]
      close_fancybox_and_reload_page
    else
      reload_form_in_fancybox
    end
  end

  private

  def load_car
    @car = Car.find params[:id]
  end
end
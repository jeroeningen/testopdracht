# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #check if in admin routing
  def admin_routing?
    controller.request.path.starts_with? "/admin"
  end

  #checks if you're in the edit or update action
  def edit_or_update?
    ["edit", "update"].include?(respond_to?(:action_name) ? action_name : controller.action_name)
  end

  #checks if you're editing or creating an object
  def creating_or_editing?
    ["new", "create", "edit", "update"].include?(respond_to?(:action_name) ? action_name : controller.action_name)
  end

  #return the current controller
  def current_controller
    controller.controller_name
  end

  #check if the given controller is the current controller
  def current_controller?(controller)
    current_controller == controller
  end

  #adds class 'active' to the link if the controller is the current controller
  def active_link?(controller)
    current_controller?(controller) ? {:class => :active} : {}
  end

  #checks if session enable_lightbox is true
  def enable_lightbox?
    session[:enable_lightbox] == true
  end

  #checks if parameter close_lightbox is "1"
  def close_lightbox?
    params[:close_lightbox] == "1"
  end

  #render the action or a partial
  def render_action_or_partial
    render(enable_lightbox? ? {:partial => action_name} : action_name)
  end

  #return the menuitems for the menu
  def menuitems
    admin_routing? ? ["users"] : []
  end
end
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #checks if you're in the edit or update action
  def edit_or_update?
    ["edit", "update"].include?(controller.action_name)
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
end

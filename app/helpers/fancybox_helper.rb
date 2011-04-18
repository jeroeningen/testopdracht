module FancyboxHelper
  include ApplicationHelper

  #return javascript to close the fancybox
  def close_fancybox_and_reload_page
    render :update do |page|
      page << "$.fancybox.close();location.reload();"
    end
  end

  #if fancybox is enabled, close the lightbox and reload the page otherwise do a redirect
  def redirect_or_close_fancybox_and_reload_page
    if enable_lightbox?
      close_fancybox_and_reload_page
    else
      redirect_to "/#{controller_path}"
    end
  end

  #reload the form in the fancybox
  def reload_form_in_fancybox
    render :update do |page|
      page << "$('div#fancybox-content').html('#{escape_javascript render(:partial => "#{controller.controller_path}/" + (edit_or_update? ? "edit.html" : "new.html"))}');$.fancybox.resize();"
    end
  end

  #if fancybox is enabled reload the form in the fancybox otherwise render the action
  def render_action_or_reload_form_in_fancybox
    if enable_lightbox?
      reload_form_in_fancybox
    else
      render(:template => "#{controller_path}/" + (edit_or_update? ? "edit.html" : "new.html"))
    end
  end

  #create the link to the fancybox
  def link_to_fancybox name, url
    link_to_function name, "link_to_fancybox_or_not('#{url}')"
  end

  #create link to go back based on if the fancybox is enabled
  def link_to_go_back
    link_to_function "Back", "go_back()"
  end

  #create a button to close the fancybox
  def button_to_close_fancybox name
    button_to_function name, "$.fancybox.close()"
  end

  #create link to delete-method
  #onclick check if the fancybox is used to open the link
  def delete_link_to_fancybox name, url
    link_to name, url, :class => "delete_link_fancybox", :method => :delete
  end
end
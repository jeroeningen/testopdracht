module FancyboxHelper
  include ApplicationHelper

  #return javascript to close the lightbox
  def close_fancybox_and_reload_page
    render :update do |page|
      page << "$.fancybox.close();location.reload();"
    end
  end

  #reload the form in the lightbox
  def reload_form_in_fancybox
    render :update do |page|
      page << "$('div#fancybox-content').html('#{escape_javascript render(:partial => "#{controller.controller_path}/" + (edit_or_update? ? "edit.html" : "new.html"))}');$.fancybox.resize();"
    end
  end

  #create the link to the lightbox
  def link_to_fancybox name, url
    link_to_function name, "$.fancybox({href:'#{url}'})"
  end

  #create link to close the lightbox
  def link_to_close_fancybox name
    link_to_function name, "$.fancybox.close()"
  end

  #create a button to close the lightbox
  def button_to_close_fancybox name
    button_to_function name, "$.fancybox.close()"
  end
end
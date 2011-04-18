#helper used by Rspec
module RspecCustomHelper
  #close fancybox and reload page
  def response_should_close_fancybox_and_reload_page
    response.body.should == "$.fancybox.close();location.reload();"
  end

  #respond with errors
  def should_respond_with_errors
    response.body.should =~ /errors prohibited/
  end

  #return attributes of the active_record, except created_at and updated_at
  def attributes_for(active_record)
    eval(active_record.to_s.capitalize).new("").attributes.keys.delete_if{|key| ["updated_at", "created_at"].include?(key)}.sort
  end

  #check if all the user labels are rendered
  def should_contain_the_user_labels
    attributes_for(:user).each do |value|
      rendered.should =~ /<label>\n#{value.to_s.capitalize}:\n<\/label>/
    end
  end

  #check if all the userform labels are rendered
  def should_contain_the_userform_labels
    attributes_for(:user).each do |value|
      rendered.should =~ /<label for="user_#{value}">#{value.to_s.capitalize}<\/label>/
    end
  end

  #tests if full html is rendered
  def should_render_full_html
    response.body.should =~ /DOCTYPE/
  end

  #tests if a partial is rendered
  def should_render_partial
    response.body.should_not =~ /DOCTYPE/
  end

  #render the user views
  def render_userviews
    assign(:user, @jeroen)
    render
  end
end
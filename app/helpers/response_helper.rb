#helper used by Rspec
module ResponseHelper
  #close fancybox and reload page
  def response_should_close_fancybox_and_reload_page
    response.body.should == "$.fancybox.close();location.reload();"
  end

  #respond with errors
  def should_respond_with_errors
    response.body.should =~ /errors prohibited/
  end

  #return attributes with validations
  def validated_attributes_for(model)
    eval(model.to_s.capitalize).create.errors.keys
  end

  #check if all the labels are rendered
  def should_contain_the_labels labels = nil
    (labels ? labels : validated_attributes_for(view_name)).each do |value|
      rendered.should =~ /<label>\n#{value.to_s.capitalize}:\n<\/label>/
    end
  end

  #check if all the form labels are rendered
  def should_contain_the_form_labels labels = nil
    (labels ? labels : validated_attributes_for(view_name)).each do |value|
      rendered.should =~ /<label for="#{view_name}_#{value}">#{value.to_s.capitalize}<\/label>/
    end
  end

  #determines the view_name
  def view_name
    controller.controller_path.gsub("admin/", "").singularize.to_sym
  end

  #prepare the views, set instance variable in the view
  def prepare_views var_in_view
    assign(view_name, var_in_view)
    render
  end
end
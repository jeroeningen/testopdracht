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

  #check if all the user labels are rendered
  def should_contain_the_user_labels
    validated_attributes_for(:user).each do |value|
      rendered.should =~ /<label>\n#{value.to_s.capitalize}:\n<\/label>/
    end
  end

  #check if all the userform labels are rendered
  def should_contain_the_userform_labels
    validated_attributes_for(:user).each do |value|
      rendered.should =~ /<label for="user_#{value}">#{value.to_s.capitalize}<\/label>/
    end
  end

  #prepare the user views
  def prepare_userviews
    assign(:user, @jeroen)
    render
  end
end
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
  
  #check if all the labels are rendered
  def should_contain_the_user_labels
    rendered.should =~ /Firstname/
    rendered.should =~ /Lastname/
    rendered.should =~ /Street/
    rendered.should =~ /Zipcode/
    rendered.should =~ /City/
  end
  
  #prepare the user views
  def prepare_userviews
    assign(:user, @jeroen)
    render
  end

end

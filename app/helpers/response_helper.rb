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
  def should_contain_the_user_labels(form = false)
    ["firstname", "lastname", "street", "zipcode", "city"].each do |value|
      if form
        rendered.should =~ /<label for="user_#{value}">#{value.capitalize}<\/label>/
      else
        rendered.should =~ /<label>\n#{value.capitalize}:\n<\/label>/
      end
    end
  end

  #prepare the user views
  def prepare_userviews
    assign(:user, @jeroen)
    render
  end
end
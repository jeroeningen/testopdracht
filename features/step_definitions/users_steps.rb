#wait 1 second until javascript is executed
When /^I wait one second$/ do
  sleep(1)
end

#the fancybox window is shown
#note that you need to wait one second before the fancybox is shown 
Then /^I should see the fancybox$/ do
  sleep(1)
  text = "Fancybox modified by Jeroen van Ingen"
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

#the fancybox window is not shown
#note that you need to wait one second before the fancybox is hidden
Given /^I should not see the fancybox$/ do
  sleep(1)
  text = "Fancybox modified by Jeroen van Ingen"
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

#Geocoding shows the location
Then /^Geocoding shows "([^"]*)"$/ do |location|
  sleep(2)
  if page.respond_to? :should
    page.should have_content(location)
  else
    assert page.has_content?(location)
  end
end

#wait 1 second until javascript is executed
When /^I wait one second$/ do
  sleep(1)
end

#the lightbox window is shown
#note that you need to wait one second before the lightbox is shown 
Then /^I should see the lightbox$/ do
  sleep(1)
  text = "Fancybox modified by Jeroen van Ingen"
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

#the lightbox window is not shown
#note that you need to wait one second before the lightbox is hidden
Given /^I should not see the lightbox$/ do
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

#Check whether the menu item is highlighted
Given /^the menuitem "([^"]*)" is highlighted$/ do |menuitem|
  page.find(:xpath, '//a[@class="active"]').text.should == menuitem.capitalize
end

#confirm a destroy using the javascript confirmbox
When /^I confrm the destroy using the confirm dialog$/ do
  page.evaluate_script("window.confirm = function() { return true; }")
  click_link("Destroy")
end

#cancel the desttroy using the javascript confirmbox
When /^I cancel the destroy using the confirm dialog$/ do
  page.evaluate_script("window.confirm = function() { return false; }")
  click_link("Destroy")
end

Then /^I should see the menu$/ do
  menuitems = "Home Users"
  if page.respond_to? :should
    page.find(:xpath, '//div[@id="menu"]').should have_content(menuitems)
  else
     page.find(:xpath, '//div[@id="menu"]').text.should == menuitems
  end
end
Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end

Then /^I should see button "([^"]*)"$/ do |button|
  page.should have_button button
end

Then /^I should see link "([^"]*)"$/ do |link|
  page.should have_link link
end

Then /^I should see link at index "([^"]*)"$/ do |index|
  page.should have_link $cached_object.get(index)
end

Then /^I should see list "([^"]*)"$/ do |list|
  page.should have_select list
end

When /^I should see field "([^"]*)"$/ do |field|
  page.should have_field field
end

Then /^The page title should be "([^"]*)"$/ do |title|
  page.should have_title title
end

When /^I should not see field "([^"]*)"$/ do |field|
  page.should_not have_field field
end

Then /^I should not see link "([^"]*)"$/ do |link|
  page.should have_no_link link
end

Then /^I should not see button "([^"]*)"$/ do |button|
  page.should have_no_button button
end

When /^I should not see "([^"]*)"$/ do |text|
  page.should have_no_content text
end

When /^I should not see list "([^"]*)"$/ do |list|
  page.should have_no_select list
end

Then /^I should see "([^"]*)" in list "([^"]*)"$/ do |option, list|
  option = Mmt::Base::Util.unescape option
  page.should have_select list, :with_options => [option]
end

When /^I should see default value "([^"]*)" in list "([^"]*)"$/ do |option, list|
  page.should have_select list, :selected => option
end

Then /^I should see alert message as "([^"]*)"$/ do |message|
  Mmt::Base::Util.get_alert_text.should == message
end

Then /^I should not see "([^"]*)" in list "([^"]*)"$/ do |option, list|
  page.should have_no_select list, :with_options => [option]
end

Then /^I should see no option in list "([^"]*)"$/ do |list|
  page.should have_select list, :options => []
end

When /^I should see radio "([^"]*)" is checked$/ do |option|
  page.should have_checked_field option
end

When /^I should see radio "([^"]*)" is unchecked$/ do |option|
  page.should have_unchecked_field option
end

When /^I should see checkbox "([^"]*)" is checked$/ do |option|
  page.should have_checked_field option
end

When /^I should see checkbox "([^"]*)" is unchecked$/ do |option|
  page.should have_unchecked_field option
end

Then /^I should see "([^"]*)" in field "([^"]*)"$/ do |text, field|
  page.should have_field field, :with => text
end

Then(/^I should see "([^"]*)" in disabled field "([^"]*)"$/) do |text, field|
  page.should Mmt::Base::Util.have_disabled_field field, :with => text
end

Then /^I should see disabled field "([^"]*)"$/ do |field|
  page.should Mmt::Base::Util.have_disabled_field field
end

Then /^I should see disabled button "([^"]*)"$/ do |button|
  page.should Mmt::Base::Util.have_disabled_button button
end

When /^I should see disabled checkbox "([^"]*)" is checked$/ do |field|
  page.should Mmt::Base::Util.have_disabled_checked_field field
end

When /^I should see disabled radio "([^"]*)" is checked$/ do |field|
  page.should Mmt::Base::Util.have_disabled_checked_field field
end

When /^I should see disabled radio "([^"]*)" is unchecked$/ do |field|
  page.should Mmt::Base::Util.have_disabled_unchecked_field field
end

# @name: the checkbox name
When /^I should see all of the checkboxs "([^"]*)" is checked$/ do |name|
  a=  all("input[type='checkbox'][name='#{name}']")
  j = 0
  while j < a.length do
      a[j].should be_checked
    j = j+1
  end
end

# @name: the checkbox name
When /^I should see all of the checkboxs "([^"]*)" is not checked$/ do |name|
  a=  all("input[type='checkbox'][name='#{name}']")
  j = 0
  while j < a.length do
    a[j].should_not be_checked
    j = j+1
  end
end
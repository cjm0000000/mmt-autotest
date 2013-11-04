#encoding=utf-8
require 'iconv'
#测试
When /^I click button "([^"]*)"$/ do |button|
  puts button
  conv = Iconv.new('utf-8', 'iso-8859-1')
  puts conv.iconv(button)
  first(:button, button).click if has_button?button
  sleep $timeout
end

When /^I input "([^"]*)" into "([^"]*)"$/ do |text, field|
  fill_in field, :with => text if has_field?field
  sleep $timeout
end

When /^I input unique value into "([^"]*)"$/ do |field|
  string =  Mmt::Base::Util.get_unique_string
  fill_in field, :with => string if has_field?field
  sleep $timeout
end

#use this method if only one is on page
When /^I click link "([^"]*)"$/ do |link|
  first(:link, link).click if has_link?link
  sleep $timeout
end

When /^I check "([^"]*)"$/ do |option|
  check option if has_field?option
  sleep $timeout
end

When /^I uncheck "([^"]*)"$/ do |checkbox|
  uncheck checkbox if has_field?checkbox
  sleep $timeout
end

When /^I select "([^"]*)" in list "([^"]*)"$/ do |option, list|
  select option, :from =>list if has_select? list
  sleep $timeout
end

When /^I select all options in in list "([^"]*)"$/ do |list|
  if has_select? list
    find_field(list).text.each_with_index do |item,index|
      select find_field(list).find("option[#{index+1}]").text,:from => list
    end
    sleep $timeout
  end
end

When /^I choose "([^"]*)"$/ do |option|
  choose option if has_field?option
  sleep $timeout
end

When /^I check the box with value "([^"]*)"$/ do |value|
  find(:xpath, "//input[@type='checkbox'][@value='#{value}']").set(true)
end

When /^I check all the checkbox with name "([^"]*)"$/ do |name|
  allBoxex = all(:xpath, "//input[@type='checkbox'][@name='#{name}']")
  j = 0
  while j < allBoxex.length do
    allBoxex[j].set(true)
    j = j+1
  end
end

When /^I check "([^"]*)" checkbox with name "([^"]*)"$/ do |num, name|
  allBoxex = all(:xpath, "//input[@type='checkbox'][@name='#{name}']")
  j = 0
  while j < num.to_i do
    allBoxex[j].set(true)
    j = j+1
  end
end

When /^I click "([^"]*)" in radio "([^"]*)"$/ do |value, name|
  find(:xpath, "//input[@type='radio'][@value='#{value}'][@name='#{name}']").set(true)
  sleep $timeout
end

When /^I ok with alert$/ do
  Mmt::Base::Util.alert_accept
end

When /^I cancel with alert$/ do
  Mmt::Base::Util.alert_dismiss
end

When /^I wait for "([^"]*)" seconds$/ do |num|
  sleep num.to_i
end

When /^I go to "([^"]*)" page$/ do |win|
  page.driver.browser.switch_to.window page.driver.find_window(win)
  sleep $timeout
end

When /^I go back the last page$/ do
  Mmt::Base::Util.goto_last_page
  sleep $timeout
end

When /^I attach file "([^"]*)" into "([^"]*)"$/ do |file, field|
  @filepath = $TEST_DATA_DIR+'/'+file
  @filepath.gsub!(/\//, "\\")
  attach_file(field, @filepath)
  sleep $timeout
end

When /^I run script "([^"]*)"$/ do |script|
  page.evaluate_script script
  sleep $timeout
end
#Create a new site in super admin at first
Before ('@Init') do
  #
end

Before ('@After') do
  #
end


After do |scenario|
  if scenario.failed?
    File.open("./screenshots/#{scenario.name}-#{Time.new.to_i}.jpeg",'wb') do |f|
      f.write(Base64.decode64(page.driver.browser.screenshot_as(:base64)))
    end
  end
end
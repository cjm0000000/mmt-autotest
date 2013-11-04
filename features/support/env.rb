require 'rubygems'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec'
require 'lib/mmt'
require 'socket'

#init system dir
$TEST_DATA_DIR = "#{File.expand_path(File.dirname(__FILE__) +"/../../test_data/")}"


#用户登录
FIELD_USERNAME = 'user_name'
FIELD_PWD = 'password'

#首页URL
URL_INDEX='http://127.0.0.1:8080/mmt-web/index'
#登录页面URL
URL_LOGIN='http://127.0.0.1:8080/mmt-web/webservices/login'

# Capybara init
Capybara.default_selector       = :css
Capybara.default_driver         = :selenium
Capybara.default_wait_time      = 25 #When we testing AJAX, we can set a default wait time
Capybara.run_server             = false #Whether start server when testing
Capybara.ignore_hidden_elements = true #Ignore hidden elements when testing,     make helpful when you hide or show elements using javascript
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
  #Capybara::Selenium::Driver.new(lib, :browser => :ie, :resynchronize => true)
end

$timeout = 1
#$cached_object = Mmt::Base::CachedObject.new


#$image_path = "#{File.expand_path(File.dirname(__FILE__) +"/../../images_XP/")}"
#Sikuli::Config.run do |config|
#  config.image_path = $image_path
#  config.logging = false
#  config.highlight_on_find = true
#end
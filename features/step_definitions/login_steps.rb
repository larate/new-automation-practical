  # path = "C:/Users/Teacher/Desktop/repos/new-automation-practical/drivers/chromedriver.exe"
  path  = File.join(File.dirname(__FILE__), "..", "..", "drivers", "chromedriver.exe")


Given(/^I open a browser$/) do
  @browser = Selenium::WebDriver.for :chrome, driver_path: path
  url = "http://www.old.practicalsqa.net/wp-login.php"
  @browser.navigate.to url


end
When(/^I login with a "([^"]*)" username and "([^"]*)" password$/) do |username, password|
 @browser.find_element(xpath: "//input[@id = 'user_login']").send_key username
 @browser.find_element(xpath: "//input[@id = 'user_pass']").send_key password
 @browser.find_element(xpath: "//input[@id = 'wp-submit']").click

end

Then(/^I verify Practical SQA page is loaded$/) do
  @browser.find_element(xpath: "//h1[@class = 'site-title']" )
end


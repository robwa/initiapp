Given(/^I am not visiting the site$/) do
end

When(/^I enter the site$/) do
  visit '/'
end

Then(/^I should be able to create a new initiative$/) do
  page.should have_link 'Create new initiative'
end

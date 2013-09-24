Given(/^I am not visiting the site$/) do
  # Do we need to check anything here?
end

When(/^I enter the site$/) do
  visit '/'
end

Then(/^I should see the list of initiatives$/) do
  pending #page.has_selector? 'li#initiatives'
end

Then(/^I should be able to create a new initiative$/) do
  pending #page.has_link? 'Create new initiative'
end

Given(/^I am not visiting the site$/) do
end

When(/^I enter the site$/) do
  visit '/'
end

Then(/^I should be able to create a new initiative$/) do
  page.should have_link I18n.t 'initiatives.index.create'
end

Given(/^I visit the initiatives site$/) do
  visit '/'
end

When(/^I submit the desired name of the new initiative$/) do
  fill_in :name, with: 'Test Initiative'
  click_on I18n.t('initiatives.index.create')
end

Then(/^I see the homepage of the new initiative$/) do
  page.should have_title 'Test Initiative'
  page.should have_selector 'h1', text: 'Test Initiative'
end

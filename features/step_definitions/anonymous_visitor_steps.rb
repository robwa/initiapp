Given(/^a number of initiatives$/) do
  Initiative.create(name: "Test Initiative")
  Initiative.create(name: "Interesting Initiative")
  Initiative.create(name: "Something Else")
end

When(/^I choose the initiative "(.*?)" from the list$/) do |name|
  click_on name
end

When(/^I visit the initiatives website$/) do
  visit '/'
end

When(/^I submit "(.*?)" as the name of the new initiative$/) do |name|
  fill_in :initiative_name, with: name
  click_on I18n.t('initiatives.index.create')
end

Then(/^I see the homepage of "(.*?)"$/) do |name|
  expect(page).to have_title name
  expect(page).to have_selector 'h1', text: name
end

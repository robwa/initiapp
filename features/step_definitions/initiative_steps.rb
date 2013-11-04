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

Given(/^an initiative$/) do
  @initiative = Initiative.create!(name: "Test Initiative")
end

When(/^I join the initiative$/) do
  visit initiative_path(@initiative)
  fill_in :user_email, with: "some@address.email"
  click_on I18n.t('initiatives.show.join')
end

Then(/^I should be signed in$/) do
  expect(page).to have_selector 'ul#user', text: "some@address.email"
end

Then(/^I see myself in the members list$/) do
  expect(page).to have_selector 'ul#members', text: "some@address.email"
end

Given(/^an initiative named "(.*?)"$/) do |name|
  @initiative = Initiative.create(name: name)
end

When(/^I visit the initiative homepage$/) do
  visit initiative_path(@initiative)
end

Then(/^the homepage path is "(.*?)"$/) do |path|
  expect(current_path).to eq(path)
end

Given(/^an initiative with a name$/) do
  @initiative1 = Initiative.create(name: "test")
end

When(/^I create an initiative with the same name$/) do
  @initiative2 = Initiative.create(name: @initiative1.name)
end

Then(/^a suffix is added to the homepage path$/) do
  visit initiative_path(@initiative2)  
  expect(current_path).to match(/test.+/)
end

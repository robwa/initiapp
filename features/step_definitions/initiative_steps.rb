Given(/^an initiative "(.*?)"$/) do |name|
  @initiative = Initiative.create!(name: name)
end

Given(/^a number of initiatives$/) do
  step 'an initiative "Test Initiative"'
  step 'an initiative "Interesting Initiative"'
  step 'an initiative "Something Else"'
end


When(/^I visit the initiatives website$/) do
  visit '/'
end

When(/^I choose the initiative "(.*?)" from the list$/) do |name|
  click_on name
end

When(/^I visit the initiative homepage$/) do
  visit initiative_path(@initiative)
end

When(/^I submit "(.*?)" as the name of the new initiative$/) do |name|
  fill_in :initiative_name, with: name
  click_on I18n.t('initiatives.index.create')
end

When(/^I create an initiative with the same name$/) do
  @initiative2 = Initiative.create(name: @initiative.name)
end

When(/^I join the initiative$/) do
  visit initiative_path(@initiative)
  fill_in :user_email, with: "some@address.email"
  click_on I18n.t('initiatives.show.join')
end

When(/^I join "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in joining "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end


Then(/^I see the homepage of "(.*?)"$/) do |name|
  expect(page).to have_title name
  expect(page).to have_selector 'h1', text: name
end

Then(/^the homepage path is "(.*?)"$/) do |path|
  expect(current_path).to eq(path)
end

Then(/^a suffix is added to the homepage path$/) do
  visit initiative_path(@initiative2)  
  expect(current_path).to match(/test.+/)
end

Then(/^I see myself in the members list$/) do
  expect(page).to have_selector 'ul#members', text: "some@address.email"
end

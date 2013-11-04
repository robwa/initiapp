Given(/^a user "(.*?)"$/) do |email|
  User.create!(email: email)
end


When(/^I request confirmation instructions$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the confirmation page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I confirm my account$/) do
  pending # express the regexp above with the code you wish you had
end


Then(/^I am signed in$/) do
  expect(page).to have_selector 'ul#user', text: "some@address.email"
end

Then(/^I am a confirmed user$/) do
  pending # express the regexp above with the code you wish you had
end

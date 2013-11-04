Given(/^a user "(.*?)"$/) do |email|
  @user = User.create!(email: email)
end


When(/^I request confirmation instructions$/) do
  visit new_user_confirmation_url
  fill_in :user_email, with: @user.email
  click_on "Resend"
end

When(/^I visit the confirmation page$/) do
  open_last_email
  visit_in_email "Confirm"
end

When(/^I confirm my account$/) do
  fill_in :user_password, with: "password"
  fill_in :user_password_confirmation, with: "password"
  click_on "Confirm"
end


Then(/^I am signed in$/) do
  expect(page).to have_selector 'ul#user', text: "some@address.email"
end

Then(/^I am a confirmed user$/) do
  expect(@user).to be_confirmed
end

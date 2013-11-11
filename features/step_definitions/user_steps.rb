Given(/^(?:I am )?a (signed in )?user(?: "(.*?)")?$/) do |sign_in, email|
  email = email.blank? ? "user@test.net" : email
  password = "anypassword"
  @user = User.create!(email: email, password: password)
  if sign_in
    visit new_user_session_path
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    click_on "Sign in"
  end
end

Given(/^a confirmed user "(.*?)" with "(.*?)"$/) do |email, password|
  @user = User.create!(email: email, password: password)
  @user.confirm!
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
  click_on I18n.t('users.confirmations.show.confirm')
end


Then(/^I am signed in as "(.*)"$/) do |user|
  expect(page).to have_selector 'ul#user', text: user
end

Then(/^I am not signed in$/) do
  expect(page).to have_selector 'ul#user', text: I18n.t('layouts.application.sign_in')
end

Then(/^I am a confirmed user$/) do
  @user.reload
  expect(@user).to be_confirmed
end

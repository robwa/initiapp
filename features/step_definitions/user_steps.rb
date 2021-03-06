Given /^I am an? (signed out )?(anonymous|passive|active) user$/ do |no_sign_in, state|
  email ||= "user@test.net"
  password ||= "anypassword"

  case state
  when "anonymous"
    @email = email
  when "passive"
    @user = User.create!(email: email)
  when "active"
    @user = User.create!(email: email, password: password)
    @user.confirm!
    step "I sign in" unless no_sign_in
  end
  
  reset_mailer
end


When /^I sign in$/ do
  visit new_user_session_path
  fill_in :user_email, with: @user.email
  fill_in :user_password, with: @user.password
  click_on "Sign in"
end

When(/^I request confirmation instructions$/) do
  visit new_user_confirmation_url
  fill_in :user_email, with: @user.email
  click_on "Resend"
end

When(/^I visit the confirmation page$/) do
  open_last_email
  click_first_link_in_email
end

When(/^I confirm my account$/) do
  fill_in :user_password, with: "password"
  fill_in :user_password_confirmation, with: "password"
  click_on I18n.t('users.confirmations.show.confirm')
end


Then /^I should be an? (passive|active) user$/ do |state|
  @user ||= User.find_by(email: @email)
  @user.reload
  case state
  when "passive" then expect(@user).to be_passive
  when "active" then expect(@user).to be_active
  end
end

Then(/^I am signed in as "(.*)"$/) do |user|
  expect(page).to have_selector '#user-control', text: user
end

Then(/^I am not signed in$/) do
  expect(page).to have_selector '#user-control', text: I18n.t('layouts.application.sign_in')
end

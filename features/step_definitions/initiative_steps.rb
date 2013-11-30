Given(/^an initiative(?: "(.*?)")?$/) do |name|
  @initiative = Initiative.create!(name: name.blank? ? "Test Initiative" : name)
end

Given(/^a number of initiatives$/) do
  step 'an initiative "Test Initiative"'
  step 'an initiative "Interesting Initiative"'
  step 'an initiative "Something Else"'
end

Given(/^I am an? (active |passive )?member of the initiative(?: as well)?$/) do |state|
  state ||= "active "
  step "I am an #{state}user"
  @user.join(@initiative)
end

Given(/^an initiative with several members$/) do
  step "an initiative"
  User.create!(email: "test1@test.net").join(@initiative)
  User.create!(email: "test2@test.net").join(@initiative)
  User.create!(email: "test3@test.net").join(@initiative)
  User.create!(email: "test4@test.net").join(@initiative)
  User.create!(email: "test5@test.net").join(@initiative)
  reset_mailer
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

When(/^I create an initiative$/) do
  name ||= "Test Initiative"
  visit initiatives_path
  fill_in :initiative_name, with: name
  click_on I18n.t('initiatives.index.create')
  @initiative = Initiative.find_by(name: name)
end

When(/^I create an initiative with the same name$/) do
  @initiative2 = Initiative.create!(name: @initiative.name)
end

When(/^I join (?:"(.*?)"|the initiative)$/) do |name|
  name ||= @initiative.name
  email ||= @email
  email ||= @user.email if @user and @user.passive?
  visit initiative_path(Initiative.find_by!(name: name))
  within "form#new_user" do
    fill_in :user_email, with: email if email
  end
  click_on I18n.t('initiatives.show.join')
end


Then(/^I see the homepage of (?:the initiative|"(.*?)")$/) do |name|
  name ||= @initiative.name
  expect(page).to have_title name
  #expect(page).to have_selector 'h1', text: name
end

Then(/^the homepage path is "(.*?)"$/) do |path|
  expect(current_path).to eq(path)
end

Then(/^a suffix is added to the homepage path$/) do
  visit initiative_path(@initiative2)  
  expect(current_path).to match(/test.+/)
end

Then(/^I should be a member of the initiative$/) do
  @user ||= User.find_by(email: @email)
  expect(@user).to be_member_of(@initiative)
end

Then(/^I see (?:"(.*?)"|myself) in the members list$/) do |email|
  email ||= @user.email
  expect(page).to have_selector 'ul#members', text: email
end

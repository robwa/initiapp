Given(/^an initiative(?: "(.*?)")?$/) do |name|
  @initiative = Initiative.create!(name: name.blank? ? "Test Initiative" : name)
end

Given(/^a number of initiatives$/) do
  step 'an initiative "Test Initiative"'
  step 'an initiative "Interesting Initiative"'
  step 'an initiative "Something Else"'
end

Given(/^I am a signed in member of the initiative$/) do
  step "a signed in user"
  @user.join(@initiative)
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

When(/^I join (?:"(.*?)"|the initiative)(?: as "(.*?)")?$/) do |name, email|
  name ||= @initiative.name
  visit initiative_path(Initiative.find_by!(name: name))
  within "form#new_user" do
    fill_in :user_email, with: email if email
  end
  click_on I18n.t('initiatives.show.join')
end

When(/^I (?:try to |)sign in as "(.*?)" joining "(.*?)"$/) do |user, initiative|
  visit initiative_path(Initiative.find_by!(name: initiative))
  within "form#new_user" do
    fill_in :user_email, with: user
    click_on I18n.t('initiatives.show.join')
  end
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

Then(/^"(.*?)" is a member of the initiative$/) do |email|
  user = User.find_by(email: email)
  expect(user).to be_member_of(@initiative)
end

Then(/^I see (?:"(.*?)"|myself) in the members list$/) do |email|
  email ||= @user.email
  expect(page).to have_selector 'ul#members', text: email
end

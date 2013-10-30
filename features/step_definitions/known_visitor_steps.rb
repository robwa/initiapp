Given(/^an initiative and a user$/) do
  @initiative = Initiative.create!(name: "Test Initiative")
  @user = User.create!(email: "test@address.email")
end

When(/^I sign in$/) do
  visit '/'
  click_on I18n.t('layouts.application.sign_in')
  pending
end

When(/^I enter the text "(.*?)" with the title "(.*?)"$/) do |body, title|
  fill_in :text_title, with: title
  fill_in :text_body, with: body
  click_on I18n.t('initiatives.show.create_text')
end

Then(/^the text "(.*?)" with the title "(.*?)" is shown on the page$/) do |body, title|
  expect(page).to have_content(title)
  expect(page).to have_content(body)
end

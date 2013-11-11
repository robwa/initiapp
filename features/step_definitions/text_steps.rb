When(/^I enter (?:a|the) text (?:"(.*?)" )?with (?:a|the) title(?: "(.*?)")?$/) do |body, title|
  body ||= "Any text."
  title ||= "Any Title"
  fill_in :text_title, with: title
  fill_in :text_body, with: body
  click_on I18n.t('initiatives.show.create_text')
end


Then(/^the text "(.*?)" with the title "(.*?)" is shown on the page$/) do |body, title|
  expect(page).to have_content(title)
  expect(page).to have_content(body)
end

Then(/^I see a notice, that my text has been saved$/) do
  expect(page).to have_selector("div.notice", text: I18n.t('notifications.models.text.saved'))
end

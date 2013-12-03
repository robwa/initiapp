Given(/^a topic$/) do
  @topic = Topic.create!(name: "Test Topic", initiative: @initiative)
  Text.create!(body: "Here is my text.", topic: @topic, author: @user)
end

When(/^I choose the topic$/) do
  click_on @topic.name
end

Then(/^I see a page with all texts regarding the topic$/) do
  expect(page).to have_title /#{@topic.name}/
  expect(page).to have_content @topic.name
end

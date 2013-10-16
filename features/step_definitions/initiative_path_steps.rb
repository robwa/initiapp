Given(/^an initiative named "(.*?)"$/) do |name|
  @initiative = Initiative.create(name: name)
end

When(/^I visit the initiative homepage$/) do
  visit initiative_path(@initiative)
end

Then(/^the homepage path is "(.*?)"$/) do |path|
  expect(current_path).to eql(path)
end

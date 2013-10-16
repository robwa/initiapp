Given(/^an initiative named "(.*?)"$/) do |name|
  @initiative = Initiative.create(name: name)
end

When(/^I visit the initiative homepage$/) do
  visit initiative_path(@initiative)
end

Then(/^the homepage path is "(.*?)"$/) do |path|
  expect(current_path).to eq(path)
end

Given(/^an initiative with a name$/) do
  @initiative1 = Initiative.create(name: "test")
end

When(/^I create an initiative with the same name$/) do
  @initiative2 = Initiative.create(name: @initiative1.name)
end

Then(/^a suffix is added to the homepage path$/) do
  visit initiative_path(@initiative2)  
  expect(current_path).to match(/test.+/)
end

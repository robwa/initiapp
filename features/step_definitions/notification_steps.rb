Then /^I receive no email$/ do
  step "\"#{@user.email}\" should receive no email"
end  

Then /^I receive an email$/ do
  step "\"#{@user.email}\" should receive an email"
end

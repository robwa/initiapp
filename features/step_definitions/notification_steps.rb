Then(/^I receive an email confirming the creation of the initiative$/) do  
  subject ||= "test"
  step "I should receive an email"
end

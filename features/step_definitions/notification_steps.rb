Then(/^I receive an email confirming the creation of the initiative$/) do  
  subject ||= "test"
  step "I should receive an email with subject \"#{I18n.t('initiatives_mailer.join.subject')}\""
end

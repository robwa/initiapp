Then(/^I receive an email confirming the creation of the initiative$/) do  
  step "I should receive an email with subject \"#{I18n.t('initiatives_mailer.join.subject')}\""
end

Then(/^each member of the initiative (except me )?receives an email$/) do |except_me|
  @initiative.members.each do |member|
    unless except_me and member.id == @user.id
      step "\"#{member.email}\" should receive an email"
    else
      step "\"#{member.email}\" should receive no email"
    end
  end
end

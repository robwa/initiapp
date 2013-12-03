class TextsMailer < ActionMailer::Base
  def create(text, user)
    @text = text
    subject = "[#{@text.initiative.slug}] #{@text.topic.name}"
    mail(to: user.email, subject: subject)
  end
end

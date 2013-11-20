class TextsMailer < ActionMailer::Base
  default from: "from@example.com"

  def create_notification(text)
    @text = text
    mail(to: @text.author.email, subject: @text.title)
  end
end

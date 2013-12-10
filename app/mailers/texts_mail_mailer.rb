class TextsMailMailer < ActionMailer::Base
  def create(message)
    @message = message
    mail to: "debug@address.net", subject: "[initiapp] Unprocessable email"
  end
end

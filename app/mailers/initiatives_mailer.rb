class InitiativesMailer < ActionMailer::Base
  default from: "from@example.com"

  def join(user)
    @user = user
    @token = nil
    mail to: @user.email
  end
end

class InitiativesMailer < ActionMailer::Base
  def join(user)
    @user = user
    @token = nil
    mail to: @user.email
  end
end

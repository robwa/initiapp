class InitiativesMailer < ActionMailer::Base
  def join(user)
    @user = user
    @user.generate_confirmation_token!
    @token = @user.raw_confirmation_token
    mail to: @user.email
  end
end

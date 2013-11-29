require "spec_helper"

describe InitiativesMailer do
  describe "join" do
    let(:user) { User.create!(email: "test@test.net") }
    let(:mail) { InitiativesMailer.join(user) }

    it "sets subject and recipient" do
      expect(mail.subject).to eq(I18n.t('initiatives_mailer.join.subject'))
      expect(mail.to).to eq([user.email])
    end

    it "sets from to the global from address" do
      expect(mail.from).to eq([Rails.configuration.action_mailer.default_options[:from]])
    end

    it "renders the body" do
      expect(mail.body.encoded).not_to be_empty
    end
  end

end

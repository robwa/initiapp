require "spec_helper"

describe InitiativesMailer do
  describe "join" do
    let(:mail) { InitiativesMailer.join }

    it "renders the headers" do
      pending "implement spec" do
        mail.subject.should eq("Join")
        mail.to.should eq(["to@example.org"])
        mail.from.should eq(["from@example.com"])
      end
    end

    it "renders the body" do
      pending "implement spec" do
        mail.body.encoded.should match("Hi")
      end
    end
  end

end

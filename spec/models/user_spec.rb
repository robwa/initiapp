require 'spec_helper'

describe User do
  describe "validation" do
    it "is valid with only an email address" do
      user = User.new(email: "test@address.email")
      expect(user).to be_valid
    end
  end

  describe "#join" do
    let(:user) { User.create!(email: "test@address.email") }
    let(:initiative) { Initiative.create!(name: "Test Initiative") }

    it "adds itself to the initiative's members" do
      user.join(initiative)
      expect(user).to be_member_of(initiative)
    end
  end
end

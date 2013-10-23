require 'spec_helper'

describe User do
  describe "validation" do
    it "is valid with only an email address" do
      user = User.new(email: "test@address.email")
      expect(user).to be_valid
    end
  end

  describe "#join" do
    it "adds itself to the initiative's members" do
      user = User.create!(email: "test@address.email")
      initiative = Initiative.create!(name: "Test Initiative")
      user.join(initiative)
      expect(initiative.members).to include(user)
    end
  end
end

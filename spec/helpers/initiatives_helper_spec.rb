require 'spec_helper'

describe InitiativesHelper do
  describe "#user_is_member?" do
    subject { helper.user_is_member? }
    
    it "returns false if no user is signed in" do
      user_stubs
      expect(subject).to be_false
    end

    it "returns false if a user is not member of the current initiative" do
      user_stubs(sign_in: true)
      initiative_stubs
      expect(subject).to be_false
    end

    it "returns true iff a user is member of the current initiative" do
      user_stubs(sign_in: true, member: true)
      initiative_stubs
      expect(subject).to be_true
    end
  end
end

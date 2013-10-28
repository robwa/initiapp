require 'spec_helper'

describe "routing to users" do
  let(:reserved_words) { Initiative.friendly_id_config.reserved_words }

  context "existing routes" do
    it "routes to sign in and sign out paths" do
      expect(get: "/users/sign_in").to be_routable
      expect(delete: "/users/sign_out").to be_routable
    end
  end

  context "reserved words" do
    it "reserved words contain 'users'" do
      expect(reserved_words).to include("users")
    end
  end
end

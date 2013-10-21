require 'spec_helper'

describe "routing to users" do
  let(:reserved_words) { Initiative.friendly_id_config.reserved_words }

  context "existing routes" do
    it "has a route for user registration" do
      expect(post: "/users").to be_routable
    end
  end

  context "reserved words" do
    it "contains 'users' as a keyword" do
      expect(reserved_words).to include("users")
    end
  end
end

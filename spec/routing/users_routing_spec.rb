require 'spec_helper'

describe "routing to users" do
  let(:reserved_words) { Initiative.friendly_id_config.reserved_words }

  context "for the existing routes" do
    it "routes to sign in and sign out paths" do
      expect(get: "/users/sign_in").to be_routable
      expect(delete: "/users/sign_out").to be_routable
    end

    it "routes registration to devise/registrations" do
      expect(post: "/users").to route_to(controller: "devise/registrations",
                                         action: "create")
    end

    it "routes confirm to users/confirmations" do
      expect(get: "/users/confirmation").to route_to(controller: "users/confirmations",
                                                     action: "show")
      expect(patch: "/users/confirmation").to route_to(controller: "users/confirmations",
                                                       action: "confirm")
    end
  end

  context "for the reserved words" do
    it "contains 'users'" do
      expect(reserved_words).to include("users")
    end
  end
end

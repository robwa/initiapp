require 'spec_helper'

describe "routing to initiatives" do
  context "existing routes" do
    it "has a route for GET, POST /" do
      expect(get: "/").to be_routable
      expect(post: "/").to be_routable
    end

    it "routes for GET /:id to initiatives#show" do
      expect(get: "/not-a-keyword").to route_to(controller: "initiatives", 
                                                action: "show",
                                                id: "not-a-keyword")
    end

    it "routes for POST /:id to initiatives#join" do
      expect(post: "/not-a-keyword").to route_to(controller: "initiatives",
                                                 action: "join",
                                                 id: "not-a-keyword")
    end
  end

  context "non-existing routes" do
    it "doesn't have a route for GET /:id/edit" do
      expect(get: "/not-a-keyword/edit").not_to be_routable
    end

    it "doesn't have a route for PATCH, PUT, DELETE /:id" do
      expect(patch: "/not-a-keyword").not_to be_routable
      expect(put: "/not-a-keyword").not_to be_routable
      expect(delete: "/not-a-keyword").not_to be_routable
    end
  end
end

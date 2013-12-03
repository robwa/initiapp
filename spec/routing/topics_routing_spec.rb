require 'spec_helper'

describe "routing to topics" do
  context "for the existing routes" do
    it "has a route for POST /:initiative/topics" do
      expect(post: "/any-initiative/topics").to be_routable
    end
  end
end

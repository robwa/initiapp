require 'spec_helper'

describe "routing to texts" do
  context "for the existing routes" do
    it "has a route for POST /:initiative/texts" do
      expect(post: "/any-initiative/texts").to be_routable
    end
  end
end

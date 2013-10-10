require 'spec_helper'

describe InitiativesController do
  describe "POST create" do
    let(:initiative) { mock_model(Initiative).as_null_object }
    before { Initiative.stub(:new).and_return(initiative) }

    it "creates a new initiative" do
      expect(Initiative).to receive(:new).with("name" => "Test Initiative").
        and_return(initiative)
      post :create, initiative: { name: "Test Initiative" }
    end

    it "saves the initiative" do
      expect(initiative).to receive(:save)
      post :create
    end

    it "redirects to the initiative home page" do
      post :create
      expect(response).to redirect_to(initiative)
    end
  end
end

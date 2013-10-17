require 'spec_helper'

describe InitiativesController do
  describe "GET index" do
    it "creates an initiative instance" do
      expect(Initiative).to receive(:new)
      get :index
    end

    it "queries the list of initiatives" do
      expect(Initiative).to receive(:all)
      get :index
    end
  end

  describe "POST create" do
    let(:initiative) { mock_model(Initiative).as_null_object }
    let(:params) { { initiative: { name: "Test Initiative" } } }
    before { Initiative.stub(:new).and_return(initiative) }

    it "creates a new initiative" do
      expect(Initiative).to receive(:new).with("name" => "Test Initiative").
        and_return(initiative)
      post :create, params
    end

    it "saves the initiative" do
      expect(initiative).to receive(:save)
      post :create, params
    end

    it "redirects to the initiative home page" do
      post :create, params
      expect(response).to redirect_to(initiative)
    end
  end

  describe "GET show" do
    it "finds the initiative" do
      initiative = double(Initiative)
      Initiative.stub_chain(:friendly, :find).and_return(initiative)
      expect(Initiative.friendly).to receive(:find).with('test')
      get :show, id: 'test'
    end
  end
end

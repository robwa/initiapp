require 'spec_helper'

describe InitiativesController do
  let(:initiative) { mock_model(Initiative).as_null_object }
  before { Initiative.stub_chain(:friendly, :find).and_return(initiative) }

  describe "GET index" do
    it "doesn't create an initiative instance" do
      expect(Initiative).not_to receive(:new)
      get :index
    end

    it "queries the list of initiatives" do
      expect(Initiative).to receive(:all)
      get :index
    end
  end

  describe "POST create" do
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

    it "redirects to the initiative homepage" do
      post :create, params
      expect(response).to redirect_to(initiative)
    end
  end

  describe "GET show" do
    it "finds the initiative" do
      expect(Initiative.friendly).to receive(:find).with('test')
      get :show, id: 'test'
    end
  end

  describe "POST join" do
    let(:params) { { id: 'test', user: { email: 'test@address.email' } } }
    let(:user) { double(User).as_null_object }
    before { allow(User).to receive(:create).and_return(user) }

    it "finds the initiative" do
      expect(Initiative.friendly).to receive(:find).with('test')
      post :join, params
    end

    it "creates a new user from the params" do
      expect(User).to receive(:create)
      post :join, params
    end

    it "calls join() on the user with the initiative" do
      expect(user).to receive(:join).with(initiative)
      post :join, params
    end

    it "redirects to the initiative homepage" do
      post :join, params
      expect(response).to redirect_to(initiative)
    end
  end
end

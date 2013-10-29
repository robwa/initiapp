require 'spec_helper'

describe InitiativesController do
  let(:initiative) { mock_model(Initiative).as_null_object }
  before { initiative_stubs(initiative: initiative) }

  describe "GET index" do
    it "assigns @initiative" do
      get :index
      expect(assigns[:initiative]).to eq(initiative)
    end

    it "assigns @initiatives" do
      get :index
      expect(assigns[:initiatives]).to be
    end
  end

  describe "POST create" do
    let(:params) { { initiative: { name: "Test Initiative" } } }

    it "creates a new initiative" do
      expect(Initiative).to receive(:new).with("name" => "Test Initiative").
        and_return(initiative)
      post :create, params
    end

    it "saves the initiative" do
      expect(initiative).to receive(:save)
      post :create, params
    end

    context "when the initiative saves succesfully" do
      it "redirects to the initiative homepage" do
        post :create, params
        expect(response).to redirect_to(initiative)
      end
    end

    context "when the initiative fails to save" do
      before { allow(initiative).to receive(:save).and_return(false) }

      it "assigns @initiative" do
        post :create, params
        expect(assigns[:initiative]).to eq(initiative)
      end

      it "assigns @initiatives" do
        post :create, params
        expect(assigns[:initiatives]).to be
      end

      it "sets an alert message" do
        post :create, params
        expect(flash[:alert]).to eq(I18n.t 'errors.models.initiative.create')
      end

      it "renders the index template" do
        post :create, params
        expect(response).to render_template(:index)
      end
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

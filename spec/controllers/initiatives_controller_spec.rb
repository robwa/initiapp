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
    it "assigns @user" do
      get :show, id: 'test'
      expect(assigns[:user]).to be_a_new(User)
    end

    it "assigns @text" do
      get :show, id: 'test'
      expect(assigns[:text]).to be_a_new(Text)
    end

    it "finds the initiative" do
      expect(Initiative.friendly).to receive(:find).with('test')
      get :show, id: 'test'
    end
  end


  describe "POST join" do
    let(:params) { { id: 'test', user: { email: 'test@address.email' } } }
    let(:user) { User.new(email: 'test@address.email') }
    before { allow(User).to receive(:new).and_return(user) }

    it "finds the initiative" do
      expect(Initiative.friendly).to receive(:find).with('test')
      post :join, params
    end

    context "when there is no user with this email address" do
      it "creates a new user" do
        expect(User).to receive(:new)
        post :join, params
      end

      it "saves the user" do
        expect(user).to receive(:save)
        post :join, params
      end

      it "doesn't send devise's default confirmation email" do
        expect(user).not_to receive(:send_confirmation_instructions)
        post :join, params
      end

      it "sends join notification email" do
        mail = double("Mail")
        expect(InitiativesMailer).to receive(:join).and_return(mail)
        expect(mail).to receive(:deliver)
        post :join, params
      end
    end

    context "when the user was (already) persisted successfully" do
      before { allow(user).to receive(:persisted?).and_return(true) }

      it "calls join() on the user with the initiative" do
        expect(user).to receive(:join).with(initiative)
        post :join, params
      end
      
      it "sets a notification message" do
        post :join, params
        expect(flash[:notice]).to eq(I18n.t 'notifications.models.user.join')
      end

      it "redirects to the initiative homepage" do
        post :join, params
        expect(response).to redirect_to(initiative)
      end
    end

    context "when the user failed to be persisted" do
      before { allow(user).to receive(:persisted?).and_return(false) }

      it "assigns @user" do
        post :join, params
        expect(assigns[:user]).to eq(user)
      end

      it "assigns @text" do
        post :join, params
        expect(assigns[:text]).to be_a_new(Text)
      end

      it "assigns @initiative" do
        post :join, params
        expect(assigns[:initiative]).to eq(initiative)
      end

      it "sets an alert message" do
        post :join, params
        expect(flash[:alert]).to eq(I18n.t 'errors.models.user.create')
      end

      it "renders the show template" do
        post :join, params
        expect(response).to render_template(:show)
      end
    end
  end
end

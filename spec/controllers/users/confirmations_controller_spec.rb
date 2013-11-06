require 'spec_helper'

describe Users::ConfirmationsController do
  before (:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET show" do
    it "finds the user instance matching the confirmation token" do
      allow(controller).to receive(:resource_class).and_return(User)
      expect(User).to receive(:find_by)
      get :show, confirmation_token: 'abcde'
    end
  end

  describe "PATCH confirm" do
    let(:user) { User.create!(email: "test@test.org") }
    let(:params) { { user: { 
          confirmation_token: user.confirmation_token, 
          password: password,
          password_confirmation: password_confirmation
        } } }

    it "redirects to show for invalid confirmation token" do
      patch :confirm, user: { confirmation_token: 'abcde' }
      expect(response).to redirect_to(action: :show, confirmation_token: 'abcde')
    end

    context "with valid and matching passwords" do
      let(:password)              { 'password' }
      let(:password_confirmation) { 'password' }

      it "assigns the user an encrypted password" do
        patch :confirm, params
        user.reload
        expect(user.encrypted_password).to be_present
      end

      it "confirms the user" do
        patch :confirm, params
        user.reload
        expect(user).to be_confirmed
      end

      it "signs the user in" do
        patch :confirm, params
        expect(controller.current_user).to be
      end

      it "redirects to /" do
        patch :confirm, params
        expect(response).to redirect_to '/'
      end
    end

    context "with invalid but matching passwords" do
      let(:password)              { 'short' }
      let(:password_confirmation) { 'short' }

      it "doesn't assign the user an encrypted password" do
        patch :confirm, params
        user.reload
        expect(user.encrypted_password).to be_blank
      end

      it "renders show" do
        patch :confirm, params
        expect(response).to render_template :show
      end
    end

    context "with valid but different passwords" do
      let(:password)              { 'password1' }
      let(:password_confirmation) { 'password2' }

      it "doesn't assign the user an encrypted password" do
        patch :confirm, params
        user.reload
        expect(user.encrypted_password).to be_blank
      end

      it "renders show" do
        patch :confirm, params
        expect(response).to render_template :show
      end
    end
  end
end

require 'spec_helper'

describe Users::ConfirmationsController do
  describe "GET show" do
    it "finds the user instance matching the confirmation token" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      allow(controller).to receive(:resource_class).and_return(User)
      expect(User).to receive(:find_by)
      get :show, confirmation_token: 'abcde'
    end
  end

  describe "PATCH confirm" do
    it "redirects to show for invalid confirmation token" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      patch :confirm, user: { confirmation_token: 'abcde' }
      expect(response).to redirect_to(action: :show, confirmation_token: 'abcde')
    end
  end
end

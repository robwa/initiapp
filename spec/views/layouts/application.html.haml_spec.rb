require 'spec_helper'

describe 'layouts/application.html.haml' do
  before(:each) do
    allow(view).to receive(:user_signed_in?)
  end

  it "sets the content for :title as page title" do
    view.content_for(:title, "the title")
    render
    expect(rendered).to have_title("the title")
  end

  context "no user is signed in" do
    it "shows a sign in link" do
      allow(view).to receive(:user_signed_in?).and_return(false)
      render
      expect(rendered).to have_link I18n.t("layouts.application.sign_in")
    end
  end

  context "a user is signed in" do
    let(:user) { double(User, email: "test@address.email") }
    before(:each) do
      allow(view).to receive(:user_signed_in?).and_return(true)
      allow(view).to receive(:current_user).and_return(user)
    end

    it "displays the email address" do
      render
      expect(rendered).to have_selector "ul#user", text: "test@address.email"
    end

    it "shows a sign out link" do
      render
      expect(rendered).to have_link I18n.t("layouts.application.sign_out")
    end
  end

  context "flash contains a message" do
    before(:each) do
      view.flash[:alert] = "An error occured!"
    end

    it "shows the message" do
      render
      expect(rendered).to have_content "An error occured!"
    end
  end
end

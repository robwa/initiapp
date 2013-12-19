require 'spec_helper'

describe 'layouts/application.html.haml' do
  before(:each) do
    user_stubs
  end

  it "sets the content for :title as page title" do
    view.content_for(:title, "the title")
    render
    expect(rendered).to have_title("the title")
  end

  context "no user is signed in" do
    it "shows a sign in link" do
      render
      expect(rendered).to have_link t("layouts.application.sign_in")
    end
  end

  context "a user is signed in" do
    it "displays the email address" do
      user_stubs(sign_in: true, email: "test@address.email")
      render
      expect(rendered).to have_selector "#user-control", text: "test@address.email"
    end

    it "shows a sign out link" do
      user_stubs(sign_in: true)
      render
      expect(rendered).to have_link t("layouts.application.sign_out")
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

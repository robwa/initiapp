require 'spec_helper'

describe "initiatives/show.html.haml" do
  let(:name) { "Test Initiative" }
  let(:initiative) { double("Initiative", name: name).as_null_object }
  
  before(:each) do
    allow(view).to receive(:user_signed_in?)
    assign(:initiative, initiative)
  end

  it "sets the initiative name as the page title" do
    render
    expect(view.content_for(:title)).to eq(name)
  end

  it "displays the initiative name as the page header" do
    render
    expect(rendered).to have_selector('h1', text: name)
  end

  context "no user is signed in" do
    before(:each) do
      allow(view).to receive(:user_signed_in?).and_return(false)
    end

    it "shows a form for joining the initiative" do
      render
      expect(rendered).to have_selector("form[action='#{join_initiative_path(initiative)}'][method='post']")
      expect(rendered).to have_selector("form input[type='text']#user_email")
    end
  end

  context "a user is signed in" do
    let(:user) { double(User) }
    before(:each) do
      allow(view).to receive(:user_signed_in?).and_return(true)
      allow(view).to receive(:current_user).and_return(user)
  end

    context "the user is a member of the initiative" do
      before(:each) do
        allow(user).to receive(:member_of?).and_return(true)
      end

      it "doesn't show a form for joining the initiative" do
        render
        expect(rendered).not_to have_selector("form[action='#{join_initiative_path(initiative)}']")
      end

      it "displays the list of members" do
        render
        expect(rendered).to have_selector("ul#members")
      end
    end
  end
end

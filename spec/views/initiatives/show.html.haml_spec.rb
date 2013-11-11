require 'spec_helper'

describe "initiatives/show.html.haml" do
  let(:name) { "Test Initiative" }
  let(:initiative) { double("Initiative", name: name).as_null_object }
  
  before(:each) do
    user_stubs
    assign(:user, stub_model(User))
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
    it "shows a form for joining the initiative" do
      render
      expect(rendered).to have_selector("form[action='#{join_initiative_path(initiative)}'][method='post']")
      expect(rendered).to have_selector("form input[type='text']#user_email")
    end

    it "doesn't display the list of members" do
      render
      expect(rendered).not_to have_selector("ul#members")
    end
  end

  context "a user is signed in" do
    before(:each) do
      initiative_stubs
      assign(:text, mock_model("Text").as_new_record.as_null_object)
    end

    context "the user is not member of the initiative" do
      before(:each) do
        user_stubs(sign_in: true)
      end

      it "shows a form for joining the initiative" do
        render
        expect(rendered).to have_selector("form[action='#{join_initiative_path(initiative)}'][method='post']")
      end

      it "doesn't show a textfield for entering an email address" do
        render
        expect(rendered).not_to have_selector("form input#user_email")
      end

      it "doesn't display the list of members" do
        render
        expect(rendered).not_to have_selector("ul#members")
      end

      it "displays a form for creating a text" do
        render
        expect(rendered).to have_selector("form[action='#{initiative_texts_path(initiative)}'][method='post']")
        expect(rendered).to have_selector("form input#text_title")
        expect(rendered).to have_selector("form textarea#text_body")
      end
    end

    context "the user is a member of the initiative" do
      before(:each) do
        user_stubs(sign_in: true, member: true)
      end

      it "doesn't show a form for joining the initiative" do
        render
        expect(rendered).not_to have_selector("form[action='#{join_initiative_path(initiative)}']")
      end

      it "displays the list of members" do
        render
        expect(rendered).to have_selector("ul#members")
      end

      it "displays a list of texts" do
        render
        expect(rendered).to have_selector("ul#texts")
      end

      it "displays a form for creating a text" do
        render
        expect(rendered).to have_selector("form[action='#{initiative_texts_path(initiative)}'][method='post']")
        expect(rendered).to have_selector("form input#text_title")
        expect(rendered).to have_selector("form textarea#text_body")
      end
    end
  end
end

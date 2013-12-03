require 'spec_helper'

describe "initiatives/show.html.haml" do
  let(:name) { "Test Initiative" }
  let(:initiative) { double("Initiative", name: name).as_null_object }
  let(:user) { stub_model(User) }
  let(:text) { mock_model("Text", author: user).as_new_record.as_null_object }
  let(:topic) { mock_model("Topic", head: text).as_new_record.as_null_object }
  
  before(:each) do
    user_stubs
    assign(:user, user)
    assign(:initiative, initiative)
    assign(:topic, topic)
    assign(:text, text)
  end

  it "sets the initiative name as the page title" do
    render
    expect(view.content_for(:title)).to eq(name)
  end

  it "displays the initiative name as the page header" do
    pending "not sure where the initiative name will be shown" do
      render
      expect(rendered).to have_selector('h1', text: name)
    end
  end

  context "no user is signed in" do
    it "shows a form for joining the initiative" do
      render
      expect(rendered).to have_selector("form[action='#{join_initiative_path(initiative)}'][method='post']")
      expect(rendered).to have_selector("form input[type='email']#user_email")
    end

    it "doesn't display the list of members" do
      render
      expect(rendered).not_to have_selector("ul#members")
    end

    it "displays a form for creating a text" do
      render
      expect(rendered).to have_selector("form[action='#{initiative_topics_path(initiative)}'][method='post']")
      expect(rendered).to have_selector("form#new_topic input#user_email")
      expect(rendered).to have_selector("form input#topic_name")
      expect(rendered).to have_selector("form textarea#text_body")
    end
  end

  context "a user is signed in" do
    before(:each) do
      initiative_stubs
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
        expect(rendered).to have_selector("form[action='#{initiative_topics_path(initiative)}'][method='post']")
        expect(rendered).to have_selector("form input#topic_name")
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

      it "displays a list of topics" do
        render
        expect(rendered).to have_selector("ul#topics")
      end

      it "displays a form for creating a text" do
        render
        expect(rendered).to have_selector("form[action='#{initiative_topics_path(initiative)}'][method='post']")
        expect(rendered).to have_selector("form input#topic_name")
        expect(rendered).to have_selector("form textarea#text_body")
      end
    end
  end
end

require 'spec_helper'

describe TopicsController do

  describe "POST create" do
    let(:initiative) { Initiative.create!(name: "Test") }
    let(:topic) { double(Topic).as_null_object }
    let(:text) { double(Text).as_null_object }
    let(:params) { { initiative_id: initiative.friendly_id, 
        user: { email: "a@b.c" }, topic: { name: "The Title" }, 
        text: { body: "Any content." } } }
    let(:null_object) { double('null object').as_null_object }
    let(:ability) { Ability.new(nil, nil) }

    before(:each) do
      user_stubs
      allow(Topic).to receive(:new).and_return(topic)
      allow(Text).to receive(:new).and_return(text)

      allow(controller).to receive(:current_ability).and_return(ability)
      allow(ability).to receive(:can?).and_return(true)
    end

    it "creates a new text" do
      expect(Topic).to receive(:new)
      post :create, params
    end

    it "saves the text" do
      expect(topic).to receive(:save)
      post :create, params
    end


    context "when the text saves successfully" do
      it "redirects to initiatives#show" do
        post :create, params
        expect(response).to redirect_to(initiative)
      end

      it "shows a notification message" do
        post :create, params
        expect(flash[:notice]).to eq(I18n.t('notifications.models.text.saved'))
      end
    end


    context "when the text fails to save" do
      before(:each) do
        allow(topic).to receive(:save).and_return(false)
      end

      it "assigns @text" do
        post :create, params
        expect(assigns[:topic]).to eq(topic)
      end

      it "renders initiatives#show" do
        post :create, params
        expect(response).to render_template("initiatives/show")
      end
    end
  end


  describe "GET show" do
  end

end

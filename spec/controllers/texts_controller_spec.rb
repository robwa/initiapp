require 'spec_helper'

describe TextsController do

  describe "POST create" do
    let(:initiative) { Initiative.create!(name: "Test") }
    let(:the_text) { double(Text).as_null_object }
    let(:params) { { initiative_id: initiative.friendly_id, text: { 
          title: "The Title",
          body: "Any content."
        } } }

    before(:each) do
      user_stubs(sign_in: true, persist: true, authorize: true)
      allow(Text).to receive(:new).and_return(the_text)
    end

    it "creates a new text" do
      expect(Text).to receive(:new)
      post :create, params
    end

    it "saves the text" do
      expect(the_text).to receive(:save)
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
        allow(the_text).to receive(:save).and_return(false)
      end

      it "assigns @text" do
        post :create, params
        expect(assigns[:text]).to eq(the_text)
      end

      it "renders initiatives#show" do
        post :create, params
        expect(response).to render_template("initiatives/show")
      end
    end
  end

end

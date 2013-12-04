# -*- coding: utf-8 -*-
require 'spec_helper'

describe "topics/show.html.haml" do
  let(:initiative) { double(Initiative, name: "Test Initiative") }
  let(:topic) { double(Topic, name: "Whatever topic").as_null_object }
  let(:text) { stub_model(Text) }

  before(:each) do
    assign(:initiative, initiative)
    assign(:topic, topic)
    assign(:text, text)
  end

  it "sets the initiative and topic name as the page title" do
    render
    expect(view.content_for(:title)).to eq(topic.name + " · " + initiative.name)
  end

  it "renders a heading with the topic name" do
    render
    expect(rendered).to have_selector "h2", text: topic.name
  end

  it "renders a list of texts" do
    render
    expect(rendered).to have_selector "ul#texts"
  end
end

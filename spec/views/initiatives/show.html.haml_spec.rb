require 'spec_helper'

describe "initiatives/show.html.haml" do
  let(:name) { "Test Initiative" }
  let(:initiative) { double("Initiative", name: name) }

  before do
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
end

require 'spec_helper'

describe 'layouts/application.html.haml' do
  it "sets the content for :title as page title" do
    view.content_for(:title, "the title")
    render
    expect(rendered).to have_title("the title")
  end
end

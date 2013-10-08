require 'spec_helper'

describe "initiatives/index.html.haml" do
  it "shows a form for initiative creation" do
    assign(:initiative, mock_model("Initiative").as_new_record)
    render
    expect(rendered).to have_selector('form')
    expect(rendered).to have_selector('input[type=submit]')
  end
end

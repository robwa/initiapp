require 'spec_helper'

describe "initiatives/index.html.haml" do

  before do 
    assign(:initiatives, [])
  end

  it "shows a form for initiative creation" do
    render
    expect(rendered).to have_selector("form[action='#{initiatives_path}'][method='post']")
  end

  it "contains a textfield for the name of the initiative" do
    render
    expect(rendered).to have_selector("form input[type='text']#initiative_name")
  end

  it "renders a list of existing initiatives" do
    assign(:initiatives, [mock_model(Initiative, name: "Interesting Initiative")])
    render
    expect(rendered).to have_selector("ul li")
    Capybara.string(rendered).find("ul").tap do |list|
      expect(list).to have_link("Interesting Initiative")
    end
  end
end

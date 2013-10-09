require 'spec_helper'

describe "initiatives/index.html.haml" do
  let(:initiative) { mock_model("Initiative").as_new_record.as_null_object }
  before { assign(:initiative, initiative) }

  it "shows a form for initiative creation" do
    render
    expect(rendered).to have_selector("form[action='#{initiatives_path}'][method='post']")
  end

  it "contains a textfield for the name of the initiative" do
    render
    expect(rendered).to have_selector("form input[type='text']#initiative_name")
  end
end

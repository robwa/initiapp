require 'spec_helper'

describe "devise/registrations/new.html.haml" do

  before(:each) do
    allow(view).to receive(:resource).and_return(User.new)
    allow(view).to receive(:devise_error_messages!)
    stub_template "devise/shared/_links.html.haml" => ""
  end

  it "renders a form for user registration" do
    render
    expect(rendered).to have_selector("form[action='#{user_registration_path}'][method='post']")
  end

  it "shows an email input field" do
    render
    expect(rendered).to have_selector("form input[type='email']")
  end

end

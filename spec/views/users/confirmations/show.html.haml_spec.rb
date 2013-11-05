require 'spec_helper'

describe "users/confirmations/show.html.haml" do

  before(:each) do
    allow(view).to receive(:resource).and_return(User.new)
    allow(view).to receive(:resource_name).and_return(:user)
    allow(view).to receive(:devise_error_messages!)
  end

  it "renders a form for user registration" do
    render
    expect(rendered).to have_selector("form[action='#{confirm_user_confirmation_path}'][method='post']")
  end

  it "shows input fields for password and password confirmation" do
    render
    expect(rendered).to have_selector("form input[type='password']")
  end

end

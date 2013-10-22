require 'spec_helper'

describe User do
  it "is valid with only an email address" do
    user = User.new(email: "test@address.email")
    expect(user).to be_valid
  end
end

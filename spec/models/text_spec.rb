require 'spec_helper'

describe Text do
  before(:each) do
    @text = Text.new(title: "Title", body: "Body")
  end

  it "is valid with valid attributes" do
    expect(@text).to be_valid
  end

  it "is invalid without a title" do
    @text.title = nil
    expect(@text).to be_invalid
  end

  it "is invalid without a body" do
    @text.body = nil
    expect(@text).to be_invalid
  end
end

require 'spec_helper'

describe Topic do
  before(:each) do
    @topic = Topic.new(name: "Test")
  end

  it "is valid with valid attributes" do
    expect(@topic).to be_valid
  end

  it "is invalid without a name" do
    @topic.name = nil
    expect(@topic).to be_invalid
  end
end

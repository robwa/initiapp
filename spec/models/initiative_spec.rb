require 'spec_helper'

describe Initiative do
  before { @initiative = Initiative.new(name: "Test Initiative") }

  it "is valid with valid attributes" do
    expect(@initiative).to be_valid
  end

  it "is not valid without a name" do
    @initiative.name = nil
    expect(@initiative).not_to be_valid
  end
end

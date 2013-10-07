require 'spec_helper'

describe ApplicationHelper do
  describe "#title('the title')" do
    it "sets the given title as content for :title" do
      helper.title('The Title')
      content = helper.content_for(:title)
      content.should == 'The Title'
    end
  end
end

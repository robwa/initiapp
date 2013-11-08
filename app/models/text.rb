class Text < ActiveRecord::Base
  belongs_to :initiative
  belongs_to :author, class_name: "User"

  validates_presence_of :title
  validates_presence_of :body
end

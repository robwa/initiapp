class Text < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: "User"
  has_one :initiative, through: :topic

  validates_presence_of :body
end

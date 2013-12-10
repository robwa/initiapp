class Text < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: "User"
  has_one :initiative, through: :topic

  validates :body, presence: true
  validates :topic, presence: true
  validates :author, presence: true
end

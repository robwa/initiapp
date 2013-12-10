class Topic < ActiveRecord::Base
  belongs_to :initiative
  has_many :texts
  has_many :authors, through: :texts

  validates :name, presence: true
  validates :initiative, presence: true

  def head
    texts.first
  end
end

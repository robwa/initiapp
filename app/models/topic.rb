class Topic < ActiveRecord::Base
  belongs_to :initiative
  has_many :texts
  has_many :authors, through: :texts

  validates_presence_of :name

  def head
    texts.first
  end
end

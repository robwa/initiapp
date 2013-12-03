class Topic < ActiveRecord::Base
  belongs_to :initiative
  has_many :texts

  validates_presence_of :name

  def head
    texts.first
  end
end

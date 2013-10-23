class Initiative < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :memberships
  has_many :members, through: :memberships, source: :user

  validates_presence_of :name
end

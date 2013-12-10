class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :initiative

  validates :user, presence: true
  validates :initiative, presence: true
end

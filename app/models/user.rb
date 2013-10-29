class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships

  def password_required?
  end

  def member_of?(initiative)
    initiative.members.exists?(id)
  end

  def join(initiative)
    initiative.members << self unless member_of?(initiative)
  end
end

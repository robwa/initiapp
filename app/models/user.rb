class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships

  def password_required?
  end

  def join(initiative)
    initiative.members << self
  end
end

class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_reader :raw_confirmation_token

  has_many :memberships
  has_many :initiatives, through: :memberships
  has_many :texts

  scope :passive, -> { where(confirmed_at: nil) }

  def password_required?
    super if persisted?
  end

  def active?
    confirmed?
  end

  def passive?
    not active?
  end

  def generate_confirmation_token!
    super
  end

  def member_of?(initiative)
    initiative.members.include?(self)
  end

  def join(initiative)
    initiative.members << self
  rescue ActiveRecord::RecordNotUnique
  end
end

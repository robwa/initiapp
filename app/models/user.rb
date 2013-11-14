class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :texts

  def password_required?
    super if persisted?
  end

  def active?
    confirmed? and has_password?
  end

  def passive?
    not active?
  end

  def has_password?
    encrypted_password.present?
  end

  def authorized?(current_user)
    if current_user
      current_user.id == id
    else
      passive?
    end
  end

  def member_of?(initiative)
    initiative.members.include?(self)
  end

  def join(initiative)
    initiative.members << self
  rescue ActiveRecord::RecordNotUnique
  end
end

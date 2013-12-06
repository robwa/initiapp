class Ability
  include CanCan::Ability

  def initialize(user, initiative_id)
    can :create, Topic
    if user and user.active?
      if initiative_id.present?
        initiative = Initiative.friendly.find(initiative_id)
        can :manage, Topic if initiative.members.include?(user)
      end
    end
  end
end

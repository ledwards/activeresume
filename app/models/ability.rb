class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Employment
    can :manage, Education
    can :manage, Profile, :user_id => user.id
  end
end

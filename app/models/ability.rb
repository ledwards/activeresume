class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Employment
    can :manage, Education
  end
end

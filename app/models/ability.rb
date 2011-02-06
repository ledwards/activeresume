class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Employment, :user_id => user.id
    can :manage, Education, :user_id => user.id
    can :manage, PortfolioItem, :user_id => user.id
    can :manage, Profile, :user_id => user.id
  end
end

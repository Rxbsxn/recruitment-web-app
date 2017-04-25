class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
      cannot :destroy, User, id: user.id
    else
      can :read, :all
    end
  end
end

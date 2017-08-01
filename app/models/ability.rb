class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
      cannot :destroy, User, id: user.id
    elsif user.has_role? :teacher
      can :manage, :all
    else
      can :read, :all
    end
  end
end

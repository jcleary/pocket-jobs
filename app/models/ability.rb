# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when 'child'
      can :show, User, id: user.id
      can :read, BankItem, user_id: user.id
      can :read, Payday, user_id: user.id
      can :manage, Job, user_id: user.id

    when 'parent'
      can :manage, :all

    when 'dashboard'
      can [:new, :read], Job
      can :read, User

    end
  end
end

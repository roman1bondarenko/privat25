# frozen_string_literal: true

class ManagerAbility
  include CanCan::Ability

  def initialize(manager)
    manager ||= manager.new
    can :manage, Manager, manager_id: manager.id
    can :manage, :manager
  end
end

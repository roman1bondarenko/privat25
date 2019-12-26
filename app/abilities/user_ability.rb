# frozen_string_literal: true

class UserAbility
  include CanCan::Ability

  def initialize(user)
    user ||= user.new
    can :manage, User, user_id: user.id
  end
end

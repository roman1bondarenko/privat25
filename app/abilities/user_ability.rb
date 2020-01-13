# frozen_string_literal: true

class UserAbility
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    can [:crud], User, id: user.id
    can [:crud], Bill, user_id: user.id
  end
end

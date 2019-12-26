# frozen_string_literal: true

module DeviseAccessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_manager
      flash.clear
      redirect_to('#autenticatedManagerPath') && return
    elsif current_user
      flash.clear
      redirect_to('#autenticatedUserPath') && return
    end
  end
end
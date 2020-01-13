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
      redirect_to(cabinets_manager_index_path) && return
    elsif current_user
      flash.clear
      redirect_to(cabinets_user_path(current_user.id)) && return
    end
  end
end
# frozen_string_literal: true

module Accessible
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
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to('#autenticatedUserPath') && return
    end
  end
end

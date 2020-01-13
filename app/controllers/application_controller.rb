# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  # load_and_authorize_resource

  rescue_from CanCan::AccessDenied do
    redirect_to '/403.html'
  end

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to '/404.html'
  end

  def current_ability
    @current_ability ||= current_manager ? ManagerAbility.new(current_manager) : UserAbility.new(current_user)
  end

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options
    {locale: I18n.locale}
  end
end

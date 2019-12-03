
class ApplicationController < ActionController::Base
  helper_method :get_current_user_name
  before_action :set_locale

  # TODO: rewrite this
  def get_current_user_name
    "#{current_user.first_name} #{current_user.second_name}" if current_user
  end

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options
    {locale: I18n.locale}
  end
end

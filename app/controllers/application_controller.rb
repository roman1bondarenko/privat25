class ApplicationController < ActionController::Base
  helper_method :get_current_user_name

  def get_current_user_name
    if current_user
      "#{current_user.first_name} #{current_user.second_name}"
    end
  end
end

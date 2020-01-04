class Cabinets::UserController < ApplicationController
  load_and_authorize_resource
  def index
    @current_user = current_user
  end
end

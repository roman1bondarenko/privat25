class Cabinets::UserController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @current_user = current_user
  end
end

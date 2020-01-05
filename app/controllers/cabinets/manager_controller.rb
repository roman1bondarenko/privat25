# frozen_string_literal: true

class Cabinets::ManagerController < ApplicationController
  before_action :authenticate_manager!
  load_and_authorize_resource

  def index
    @manager_first_name = current_manager.first_name
  end
end

# frozen_string_literal: true

class Cabinets::ManagerController < ApplicationController
  load_and_authorize_resource

  def index
    @manager_name = current_manager.full_name
  end
end

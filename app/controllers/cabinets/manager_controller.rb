class Cabinets::ManagerController < ApplicationController
  def index
    @manager_name = current_manager.full_name
  end
end

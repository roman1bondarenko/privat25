class Cabinets::BillsController < ApplicationController
  before_action  :authenticate_user!
  load_and_authorize_resource

  def index
    # @bill = Bill.first
  end

  def new
  end
end

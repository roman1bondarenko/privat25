class CitiesController < ApplicationController
  def index
    @cities = City.where('country_id = :country_id',
                         country_id: cities_params[:country_id])
  end

  private

  def cities_params
    params.permit(:country_id)
  end
end

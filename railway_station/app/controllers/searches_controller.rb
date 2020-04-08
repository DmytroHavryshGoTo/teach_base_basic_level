class SearchesController < ApplicationController
  def show
    search_from = params[:departure_station]
    search_to = params[:arrival_station]
    @routes = Route.find_route(search_from, search_to)

    if search_from.present? && search_to.present? && @routes.empty?
      flash.now[:alert] = 'There are no routes'
    end
  end
end
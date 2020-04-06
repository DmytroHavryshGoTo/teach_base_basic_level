class SearchesController < ApplicationController
  def show
    search_from = params[:departure_station]
    search_to = params[:arrival_station]
    @routes = Route.find_route(search_from, search_to)
  end
end
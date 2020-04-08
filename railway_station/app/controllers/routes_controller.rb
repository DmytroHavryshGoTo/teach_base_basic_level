class RoutesController < ApplicationController
  def trains_on_route
    @trains = Route.find(params[:id]).trains
  end
end

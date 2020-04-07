class Admin::TrainStationsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_train_station, only: %i[show edit update destroy update_position update_station_time]
  before_action :set_route, only: %i[update_position update_station_time]

  def index
    @train_stations = TrainStation.all
  end

  def show; end

  def new
    @train_station = TrainStation.new
  end

  def edit; end

  def create
    @train_station = TrainStation.new(train_station_params)

    respond_to do |format|
      if @train_station.save
        format.html { redirect_to admin_train_stations_path(@train_station), notice: 'Train station was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @train_station.update(train_station_params)
        format.html { redirect_to admin_train_stations_path(@train_station), notice: 'Train station was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @train_station.destroy
    respond_to do |format|
      format.html { redirect_to admin_train_stations_path, notice: 'Train station was successfully destroyed.' }
    end
  end

  def update_position
    @train_station.update_position(@route, params[:position])
    redirect_to admin_route_path(@route)
  end

  def update_station_time
    @train_station.update_time(@route, params[:departure_time], params[:arrival_time])
    redirect_to admin_route_path(@route)
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
  end

  def set_train_station
    @train_station = TrainStation.find(params[:id])
  end

  def train_station_params
    params.require(:train_station).permit(:title)
  end
end

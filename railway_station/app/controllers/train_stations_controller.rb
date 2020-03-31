class TrainStationsController < ApplicationController
  before_action :set_train_station, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @train_station, notice: 'Train station was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @train_station.update(train_station_params)
        format.html { redirect_to @train_station, notice: 'Train station was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @train_station.destroy
    respond_to do |format|
      format.html { redirect_to train_stations_url, notice: 'Train station was successfully destroyed.' }
    end
  end

  private

  def set_train_station
    @train_station = TrainStation.find(params[:id])
  end

  def train_station_params
    params.require(:train_station).permit(:title)
  end
end

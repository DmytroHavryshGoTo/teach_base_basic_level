class TrainStationsController < ApplicationController
  before_action :set_train_station, only: [:show, :edit, :update, :destroy]

  # GET /train_stations
  # GET /train_stations.json
  def index
    @train_stations = TrainStation.all
  end

  # GET /train_stations/1
  # GET /train_stations/1.json
  def show
  end

  # GET /train_stations/new
  def new
    @train_station = TrainStation.new
  end

  # GET /train_stations/1/edit
  def edit
  end

  # POST /train_stations
  # POST /train_stations.json
  def create
    @train_station = TrainStation.new(train_station_params)

    respond_to do |format|
      if @train_station.save
        format.html { redirect_to @train_station, notice: 'Train station was successfully created.' }
        format.json { render :show, status: :created, location: @train_station }
      else
        format.html { render :new }
        format.json { render json: @train_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /train_stations/1
  # PATCH/PUT /train_stations/1.json
  def update
    respond_to do |format|
      if @train_station.update(train_station_params)
        format.html { redirect_to @train_station, notice: 'Train station was successfully updated.' }
        format.json { render :show, status: :ok, location: @train_station }
      else
        format.html { render :edit }
        format.json { render json: @train_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /train_stations/1
  # DELETE /train_stations/1.json
  def destroy
    @train_station.destroy
    respond_to do |format|
      format.html { redirect_to train_stations_url, notice: 'Train station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train_station
      @train_station = TrainStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def train_station_params
      params.require(:train_station).permit(:title)
    end
end

class CarriagesController < ApplicationController
  before_action :set_carriage, only: %i[show edit update destroy]
  before_action :set_train, only: %i[new create]

  def index
    @carriages = Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def edit; end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to @carriage.becomes(Carriage)
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to carriages_path
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path
  end

  private

  def carriage_params
    params.require(:carriage).permit(:type, :top_places, :bottom_places, :seat_places, :side_bottom_places, :side_top_places, :train_id)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
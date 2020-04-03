class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def edit; end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to carriages_path
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
end
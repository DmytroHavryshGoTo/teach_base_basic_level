class TicketsController < ApplicationController
  before_action :set_train, only: %i[create new index]
  before_action :set_ticket, only: %i[show]

  def new
    @ticket = @train.tickets.build
  end

  def index
    @tickets = @train.tickets
  end

  def show; end

  def create
    @ticket = @train.tickets.new(ticket_params)
    # While not having authentication
    @ticket.user = User.first
    if @ticket.save
      redirect_to train_ticket_path(@train, @ticket)
    else
      redirect_to new_train_ticket_path(@train)
    end
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:last_name, :first_name, :passport_number, :base_station_id, :end_station_id)
  end
end
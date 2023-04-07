class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    # @moto = Moto.find(params[:moto_id])
    # @reservation = Reservation.new(moto_id: @moto.id)
    # @reservations = @moto.reservations.order(:start_time)
  end

  def create
    resa = Reservation.new(
      start_time: params[:reservation][:start_time],
      end_time: params[:reservation][:end_time],
      moto_id: params[:moto_id]
    )
    # resa.save()
    resa.user = current_user
    redirect_to reservation_path(resa) if resa.save!
  end
end

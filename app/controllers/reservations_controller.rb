class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation= Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    resa = Reservation.new(
      start: params[:reservation][:start],
      end: params[:reservation][:end],
      moto_id: params[:moto_id]
    )
    # resa.save()
    resa.user = current_user
    redirect_to reservation_path(resa) if resa.save!
  end
end

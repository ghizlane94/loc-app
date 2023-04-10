class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation.all)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @start_time = @reservation.start_time
    @end_time = @reservation.end_time
    authorize @reservation
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(
      start_time: params[:reservation][:start_time],
      end_time: params[:reservation][:end_time],
      moto_id: params[:moto_id]
    )
    authorize @reservation
    # resa.save()
    @reservation.user = current_user
    redirect_to reservation_path(@reservation) if @reservation.save!
  end
end

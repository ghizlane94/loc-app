class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @motos = policy_scope(Moto)
    @reservation = Reservation.new
  end
end

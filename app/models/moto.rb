class Moto < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy

  def available_dates
    next_reservation = reservations.where("start_time > ? AND end_time > ? ", Date.today, Date.today + 30).order(start_time: :asc).first
    #return a list of reservation which starts in the future from today actually and finish 30 days later
    
    if next_reservation.nil?
      return start_time == Date.today && end_time == Date.today + 30
    end
  end
end

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :moto
  validates :start_time, :end_time, presence: true
  validate :end_time_after_start_time
  # validate :no_overlapping_reservations

  def end_time_after_start_time
    if end_time.present? && start_time.present? && end_time <= start_time
      errors.add(:end_time, "must be after start time")
    end
  end

  # def no_overlapping_reservations
  #   if moto.reservations.where.not(id: id).where("(? < end_time) and (start_time < ?)", end_time, start_time).exists?
  #     errors.add(:base, "Reservation overlaps with an existing reservation")
  #   end
  # end
end

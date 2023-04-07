class RenameColumnsInReservations < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :start, :start_time
    rename_column :reservations, :end, :end_time
  end
end

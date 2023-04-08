class RemoveEndFromMoto < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :end, :datetime
  end
end

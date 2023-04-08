class RemoveStartFromMoto < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :start, :datetime
  end
end

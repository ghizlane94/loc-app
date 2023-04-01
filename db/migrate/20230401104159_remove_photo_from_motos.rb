class RemovePhotoFromMotos < ActiveRecord::Migration[7.0]
  def change
    remove_column :motos, :photo, :string
  end
end

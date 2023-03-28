class AddTitleToMoto < ActiveRecord::Migration[7.0]
  def change
    add_column :motos, :title, :string
  end
end

class AddImageUrlToMotos < ActiveRecord::Migration[7.0]
  def change
    add_column :motos, :image_url, :string
  end
end

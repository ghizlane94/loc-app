class CreateMotos < ActiveRecord::Migration[7.0]
  def change
    create_table :motos do |t|
      t.text :description
      t.float :price
      t.string :brand
      t.string :color
      t.integer :year
      t.integer :mileage
      t.datetime :status
      t.string :photo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

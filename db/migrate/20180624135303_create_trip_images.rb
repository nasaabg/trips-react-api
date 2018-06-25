class CreateTripImages < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_images do |t|
      t.references :trip, foreign_key: true
      t.string :image
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end

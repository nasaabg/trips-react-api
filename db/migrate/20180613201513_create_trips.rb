class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    create_table :trips_users, id: false do |t|
      t.belongs_to :trip, index: true
      t.belongs_to :user, index: true
    end
  end
end

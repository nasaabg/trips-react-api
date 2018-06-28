# frozen_string_literal: true

class AddContinentIdToTrips < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :continent, foreign_key: true
  end
end

# frozen_string_literal: true

class TripsController < ApplicationController
  before_action :set_trip, only: %i[show update destroy]

  # GET /trips
  def index
    @trips =
      if params[:continent_id]
        Trip.where(continent_id: params[:continent_id])
      else
        Trip.all
      end

    render json: @trips
  end

  # GET /trips/1
  def show
    render json: @trip
  end

  def my_trips
    render json: @current_user.trips
  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)
    @trip.continent = Continent.first
    @trip.owners << @current_user

    if @trip.save && @current_user.save!
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trip
    @trip = Trip.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def trip_params
    params.require(:trip).permit(:name, :description)
  end
end

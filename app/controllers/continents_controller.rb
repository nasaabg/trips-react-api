class ContinentsController < ApplicationController
  before_action :set_continent, only: [:show]

  # GET /continents
  def index
    @continents = Continent.all

    render json: @continents
  end

  # GET /continents/1
  def show
    render json: @continent
  end

  private
    def set_continent
      @continent = Continent.find(params[:id])
    end
end

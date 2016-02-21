class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :update]

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def new
  	@measurement = Measurement.new
  end

  private

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

end

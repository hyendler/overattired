class Products::MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update]

  def show
    # returns @measurement
  end

  def edit
    # returns @measurement
  end

  private
  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

end

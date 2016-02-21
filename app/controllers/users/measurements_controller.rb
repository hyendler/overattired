class Users::MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :update, :destory]

  def show
    # returns @measurement
  end

  def edit
    # returns @measurement
  end

  def update
  end

  private
  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

end

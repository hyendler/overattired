class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :update]

  def show
  end

  def edit
  end

  def create
    @measurement = Measurement.new(measurement_params)
    if @measurement.save
      redirect_to user_path(current_user.id)
    end
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

  def measurement_params
    params.require(:measurement).permit(:hips, :waist, :bust, :chest, :inseam, :measurable_type, :measurable_id)
  end

end




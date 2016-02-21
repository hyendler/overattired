class Products::MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update]

  def show
    # returns @measurement
  end

  def edit
    # returns @measurement
  end

  def update
    if @measurement.update(measurement_params)
      redirect_to products_measurement_path
    else
      errs
      render 'edit'
    end
  end

  def new
    @measurement = Measurement.new
  end

  def create
    @measurement = Measurement.new(measurement_params)
    if @measurement.save
      redirect_to products_measurement_path
    else
      errs
      render 'new'
    end
  end


  private

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

  def measurement_params
    params.require(:measurement).permit(:hips, :waist, :bust, :chest, :inseam, :measurable_type, :measurable_id)
  end

  def errs
    errors = @measurement.errors
  end

end

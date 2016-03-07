class ProductMeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update]

  def show
    # returns @measurement
  end

  def edit
    @measurable = find_measurable
    # returns @measurement
  end

  def update

  end

  # def new
  # end

  # def create
  # end

  private

  def set_measurement
    @measurement = ProductMeasurement.find(params[:id])
  end

  def product_measurement_params
    params.require(:measurement).permit(:hips, :waist, :bust, :chest, :inseam, :gender, :shoulders, :sleeve_length, :overall_length)
  end

  def find_measurable
    @measurable = Product.find(params[:product_id])
  end

  def errs
    errors = @measurement.errors
  end

end

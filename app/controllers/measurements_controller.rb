class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update]

  def show
    # returns @measurement
  end

  def edit
    @product = Product.find(params[:id])
    # returns @measurement
  end

  def create
    if params[:product_id]
      @measurable = Product.find(params[:product_id])
    else
      @measurable = User.find(params[:user_id])
    end

    @measurement = Measurement.new(measurement_params)
    @measurement.measurable = @measurable

    if @measurement.save
      if @measurement.measurable_type == "Product"
        redirect_to product_measurement_path(@measurable.id, @measurement.id)
      else
        redirect_to user_measurement_path(@measurable.id, @measurement.id)
      end
    else
      errs
      render 'new'
    end
  end

  def update
    if @measurement.update(measurement_params)
      if @measurement.measurable_type == "Product"
        redirect_to product_measurement_path(@measurement.measurable.id, @measurement.id)
      else
        redirect_to user_measurement_path(@measurement.measurable.id, @measurement.id)
      end
    else
      errs
      render 'edit'
    end
  end

  def new
    @product = Product.find(params[:product_id])
  	@measurement = Measurement.new
  end

  private

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

  def measurement_params
    params.require(:measurement).permit(:hips, :waist, :bust, :chest, :inseam, :gender)
  end

  def errs
    errors = @measurement.errors
  end

end

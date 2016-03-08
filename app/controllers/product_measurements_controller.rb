class ProductMeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update]

  def show
    # returns @measurement
  end

  def edit
    @product = Product.find(params[:product_id])
    # returns @measurement
  end

  def update
    if @measurement.update(product_measurement_params)
      redirect_to product_path(@measurement.product_id)
    else
      errs
      render 'edit'
    end
  end

  def new
    @product = Product.find(params[:product_id])
    @measurement = ProductMeasurement.new
  end

  def create
    @product = Product.find(params[:product_id])
    @measurement = ProductMeasurement.new(product_measurement_params)
    @measurement.product_id = @product.id

    if @measurement.save
      redirect_to product_path(@product)
    else
      errs
      render 'new'
    end
  end

  private

  def set_measurement
    @measurement = ProductMeasurement.find(params[:id])
  end

  def product_measurement_params
    params.require(:product_measurement).permit(:hips, :waist, :bust, :chest, :inseam, :gender, :shoulders, :sleeve_length, :overall_length)
  end

  def find_measurable
    @measurable = Product.find(params[:product_id])
  end

  def errs
    errors = @measurement.errors
  end

end

class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update]
  after_action :send_user_mail, only: [:create]

  def send_user_mail
    @user = User.find(@measurement.measurable.id)
    UserMailer.welcome_email(@user).deliver_now
  end

  def show
    # returns @measurement
  end

  def edit
    @measurable = find_measurable
    # returns @measurement
  end

  def create
    @measurable = find_measurable
    @measurement = Measurement.new(measurement_params)
    @measurement.measurable = @measurable

    if @measurement.save
      if @measurement.measurable_type == "Product"
        redirect_to product_measurement_path(@measurable.id, @measurement.id)
      else
        redirect_to user_path(@measurable)
      end
    else
      errs
      render 'new'
    end
  end

  def update
    if @measurement.update(measurement_params)
      if @measurement.measurable_type == "Product"
        redirect_to product_path(@measurement.measurable.id)
      else
        redirect_to user_path(@measurement.measurable.id)
        # redirect_to user_measurement_path(@measurement.id, @measurement.measurable.id)
      end
    else
      errs
      render 'edit'
    end
  end

  def new
    @measurable = find_measurable
  	@measurement = Measurement.new
  end

  private

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

  def measurement_params
    params.require(:measurement).permit(:hips, :waist, :bust, :chest, :inseam, :comment, :gender, :shoulders, :sleeve_length, :overall_length)
  end

  def find_measurable
    if params[:product_id]
      @measurable = Product.find(params[:product_id])
    else
      @measurable = User.find(params[:user_id])
    end
  end

  def errs
    errors = @measurement.errors
  end

end

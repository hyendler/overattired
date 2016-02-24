class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update]
  after_action :contact, only: [:create]
  # ----------------------------------------
  # THESE ARE THE METHOD NEEDED TO SEND USER WELCOME EMAIL UPON
  # CREATING A MEASUREMENT FORM
  # after_action :send_user_mail, only: [:create]

  # def send_user_mail
  #   @user = User.find(@measurement.measurable.id)
  #   UserMailer.welcome_email(@user).deliver_now
  # end
  # ----------------------------------------

  def contact
    h = JSON.generate({ 'name' => params[:name],
                        'email' => params[:email],
                        'message' => params[:message] })

    PostmanWorker.perform_async(h, 5)

    # if instead of sidekiq I was just sending email from rails
    # VisitorMailer.contact_email(@name, @email, @message).deliver

    # redirect_to :root
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

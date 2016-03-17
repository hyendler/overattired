class UserMeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update]
  # after_action :contact, only: [:create]

  def show
    # returns @measurement
  end

  def edit
    @user = User.find(params[:user_id])
    # returns @measurement
  end

  def update
     @user = User.find(params[:user_id])
    if @measurement.update(user_measurement_params)
      redirect_to user_path(@measurement.user_id)
    else
      errs
      puts "I'm about to render edit"
      render 'edit'
    end
  end

  def new
    @user = User.find(params[:user_id])
    @measurement = UserMeasurement.new
  end

  def create
    @user = User.find(params[:user_id])
    @measurement = UserMeasurement.new(user_measurement_params)
    @measurement.user_id = @user.id

    if @measurement.save
      redirect_to user_path(@user)
    else
      errs
      render 'new'
    end
  end

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
    # Look in the rails server - if you see all the stars it means that this method has started running
    p '* ' * 1000
    @user = User.find(params[:user_id])
    # p "The contact method ran for #{@user.first_name}"
    # don't really need 'name' here can remove it for refactoring
    h = { 'name' => @user.first_name,
          'email' => @user.email}
    # just testing whether the inputs show up:
    # p "THE INPUTS THAT GOES INTO THE EMAIL ARE:"
    # p h
    # p "before worker call"
    PostmanWorker.perform_async(h, 5)
    # NOW GO LOOK IN THE app/workers/postman_worker.rb
    # If you see the follow text, it means this method has ran! Good job.
    # p "After worker call"
    # if instead of sidekiq I was just sending email from rails
    # VisitorMailer.contact_email(@name, @email, @message).deliver
    # redirect_to :root
  end

  private

  def set_measurement
    @measurement = UserMeasurement.find(params[:id])
    @measurement
  end

  def user_measurement_params
    params.require(:user_measurement).permit(:hips, :waist, :bust, :chest, :inseam, :comment, :gender)
  end

  def errs
    errors = @measurement.errors
  end

end

class UserMeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update]
  after_action :contact, only: [:create]

  def show
    # returns @measurement
  end

  def edit
    # @measurable = find_measurable # do we need this?
    # returns @measurement
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
    @user = User.find(@measurement.measurable.id)
    # p "The contact method has been ran for #{@user.first_name}"
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
  end

  def user_measurement_params
    params.require(:measurement).permit(:hips, :waist, :bust, :chest, :inseam, :comment, :gender)
  end

  def find_measurable
    @measurable = User.find(params[:user_id])
  end

  def errs
    errors = @measurement.errors
  end

end

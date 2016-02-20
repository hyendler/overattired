class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    # returns @user
  end

  def edit
  end

  def update
    p "************************"
    p params
    p "************************"
    p params[:user]
    p "************************"
    p params[:user][:measurement]
    p "************************"

    if @user.measurement
      if @user.update(user_params)
        redirect_to user_path
      else
        errs
        render 'edit'
      end
    else # user does not have a measurement
      measurement = Measurement.new(params[:user][:measurement])
      measurement.measurable_id = @user.id
      if measurement.save!


      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, measurement_attributes: [:id, :gender, :hip, :waist, :bust, :chest, :inseam])
  end

  def errs
    errors = @user.errors
  end
end

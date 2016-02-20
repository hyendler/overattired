class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    # returns @user
  end

  def edit
    # returns @user
  end

  # def new
  #   super
  #   # something
  # end

  def update

    if @user.measurement
      if @user.update(params[:user]) && @user.measurement.update(params[:user][:measurement])
        # p @user.measurement
        redirect_to user_path
      else
        errs
        render 'edit'
      end
    else
      measurement = Measurement.new(user_params[:measurement])
      @user.measurement = measurement
      if @user.update(user_params)
        redirect_to user_path
      else
        errs
        render 'edit'
      end
    end
    # p "************************"
    # p params
    # p "************************"
    # p params[:user]
    # p "************************"
    # p params[:user][:measurement]
    # p "************************"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      p "************************"
      p "USER_PARAMS METHOD"
      p "************************"
      p "PARAMS:"
      p "************************"
      p params
      p "************************"
    params.require(:user).permit(:first_name, :last_name, :gender, {measurement: [:id, :gender, :hip, :waist, :bust, :chest, :inseam]})
  end

  def errs
    errors = @user.errors
  end
end

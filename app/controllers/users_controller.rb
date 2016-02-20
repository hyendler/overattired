class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    # returns @user
  end

  def edit
    # returns @user
  end

  def update

    if @user.update(user_params)
      p @user.measurement
      redirect_to user_path
    else
      errs
      render 'edit'
    end

    p "************************"
    p params
    p "************************"
    p params[:user]
    p "************************"
    p params[:user][:measurement]
    p "************************"
    # if @user.measurement
    #   if @user.update(user_params)
    #     p "************************"
    #     p "in the first if condition"
    #     p "************************"
    #     redirect_to user_path
    #   else
    #     p "************************"
    #     p "in the first else condition"
    #     p "************************"
    #     errs
    #     render 'edit'
    #   end
    # else # user does not have a measurement
    #     p "************************"
    #     p "in the main else condition"
    #     p "************************"
    #   measurement = Measurement.new(params[:user][:measurement])
    #   @user.measurement = measurement

    #   if measurement.save!
    #     p "************************"
    #     p "in the measurement save condition"
    #     p "************************"
    #     if @user.update(user_params)
    #       p "************************"
    #       p "in the measurement user updated condition"
    #       p "************************"
    #       redirect_to user_path
    #     else
    #       p "************************"
    #       p "in the measurement user update ELSE condition"
    #       p "************************"
    #       errs
    #       render 'edit'
    #     end
    #   end
    # end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      # p "************************"
      # p "USER_PARAMS METHOD"
      # p "************************"
      # p "PARAMS:"
      # p "************************"
      # p params
      # p "************************"
    params.require(:user).permit(:first_name, :last_name, :gender, measurement: [:id, :gender, :hip, :waist, :bust, :chest, :inseam])
  end

  def errs
    errors = @user.errors
  end
end

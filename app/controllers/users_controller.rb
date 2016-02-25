class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    if @user.measurement.nil?
      redirect_to new_user_measurement_path(current_user.id)
    else
      @matches = @user.match
    end
  end

  def edit
    # returns @user
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      errs
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to "/"
    # send a flash success
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def errs
    errors = @user.errors
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    # returns @user
    @matches = @user.match
  end

  def edit
    # returns @user
  end

  def update
    if @user.update(user_params)
      # p @user.measurement
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
    params.require(:user).permit(:first_name, :last_name, :gender, :hips, :waist, :bust, :chest, :inseam)
  end

  def errs
    errors = @user.errors
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    # returns @user
  end

  def edit
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  # def user_params
  # end

  # def errs
  #   errors = @user.errors
  # end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def show
    # returns @user
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

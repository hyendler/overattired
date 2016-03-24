class Admin::UsersController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy]
  before_filter :verify_admin

  def index
    @users = User.all
  end

  def show
    @matches = @user.match
  end

  def destroy
    @user.destroy
    redirect_to "/admin/users"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
end

class Admin::UsersController < Admin::BaseController
  before_action :authenticate_user!
  before_filter :verify_admin

  def index
    @users = User.all
  end

  def send_updates
  	@user = User.last
  	MatchMailer.match_email(@user).deliver_now
  	flash[:notice] = "Matches have been sent."
  	redirect_to admin_path
  end

end

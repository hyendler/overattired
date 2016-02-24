class Admin::UsersController < Admin::BaseController
  before_action :authenticate_user!
  before_filter :verify_admin

  def index
    @users = User.all
  end

  def send_order_mail
  	@users = User.all
  	UserMailer.send_updates(@user).deliver_now
  end

end

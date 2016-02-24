class Admin::UsersController < Admin::BaseController
  before_action :authenticate_user!
  before_filter :verify_admin

  def index
    @users = User.all
  end

  def send_order_mail
  	@users = User.all
  	p "HELLO THIS BUTTON WORKS"
  	UserMailer.send_updates(@user).deliver_now
  end

  def send_user_mail
    @user = User.find(@measurement.measurable.id)
    UserMailer.welcome_email(@user).deliver_now
    p @user.measurement
  end

end

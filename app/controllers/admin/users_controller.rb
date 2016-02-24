class Admin::UsersController < Admin::BaseController
  before_action :authenticate_user!
  before_filter :verify_admin

  def index
    @users = User.all
  end

  def send_updates
  	n = 6 # this is ID of the first user in your database
  	2.times do # set this the number of users you want to go through
	  	@user = User.find(n)
	  	# if user does not have a measurement object or it has no matches
	  	if ( @user.measurement == nil ) || (@user.match == [])
	  	elsif @user.admin 
	  	else
	  		MatchMailer.match_email(@user).deliver_now
	  	end
	  	n += 1
  	end
  	flash[:notice] = "Matches have been sent."
	redirect_to admin_path
  end

end

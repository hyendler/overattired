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
	  	if @user.match == [] # is there are no matches don't send an email to this user
	  		n +=1
	  	else
	  		MatchMailer.match_email(@user).deliver_now
	  		n += 1
	  	end
  	end
  	flash[:notice] = "Matches have been sent."
	redirect_to admin_path
  end

end

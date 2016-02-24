class Admin::UsersController < Admin::BaseController
  before_action :authenticate_user!
  before_filter :verify_admin

  def index
    @users = User.all
  end

  def send_updates
  	n = 1 # this is ID of the first user in your database
  	p "**************************************"
  	p "Send Updates Has been Intiated"
  	p User.count
  	while n < User.last.id # set this the number of users you want to go through
  		p "this is n"
  		p n
  		if User.exists?(n)
	  		@user = User.find(n)
	  		p @user
	  		if ( @user.measurement == nil ) || (@user.match == [])
	  		elsif @user.admin 
	  		else
	  			MatchMailer.match_email(@user).deliver_now
	  		end

	  	end

	  	n += 1
	  	# if user does not have a measurement object or it has no matches

  	end
  	p "**************************************"
  	flash[:notice] = "Matches have been sent."
	redirect_to admin_path
  end

end

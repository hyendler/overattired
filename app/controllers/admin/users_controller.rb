class Admin::UsersController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy]
  before_filter :verify_admin

  def index
    @users = User.all
  end

# this is the method that sends all users emails and it filters it out by whether user is admin or does not exist or has no matches
  def send_updates
  	n = 1 # this is ID of the first user in your database
  	p "**************************************"
  	p "Send Updates Has been Intiated"
  	p User.count
  	while n < User.last.id # set this the number of users you want to go through

  		if User.exists?(n)
	  		@user = User.find(n)

	  		if @user.admin
        elsif ( @user.measurement == nil ) || (@user.match == [])
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



class ScrapingWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # this is UTC
  recurrence { daily.hour_of_day(4).minute_of_hour(43) }


  def perform
  	# this just sends out something that says 
  	testing_method
  	# this will scrape from etsy
  	store_data_from_etsy
  	# this will send email to users
  	mail_users
    # implementation details...
    p "%" * 50
    p "DONE!!!!!"
  end


   def mail_users
    n = 1 # this is ID of the first user in your database
    while n < User.last.id # set this the number of users you want to go through

      if User.exists?(n)
      	p "User exists!"
        @user = User.find(n)
        p @user
        if @user.admin
        elsif ( @user.measurement == nil ) || (@user.match == [])
        else
          MatchMailer.match_email(@user).deliver_now
        end

      end

      n += 1
      # if user does not have a measurement object or it has no matches

    end
  end


end
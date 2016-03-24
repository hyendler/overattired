

class ScrapingWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # this is UTC
  # this is used for testing purposes
  # recurrence { hourly.minute_of_hour(0, 10, 20, 30, 40, 50) }
  # recurrence { daily.hour_of_day(4).minute_of_hour(0) }



  # this is the official time 9:00 to be send out daily
  recurrence { daily.hour_of_day(16) }



  def perform
  	# this just sends out something that says - can delete
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
    all_users = User.where(:admin => false)
    # for all users, if the user is not admin
    # => if the measurement is nil or the user has no matches via user.match or if get_new_matches returns empty hash as well, don't send
    #   else send the email

    all_users.each do |user|
      new_matches = user.get_new_matches
      p  "**************"
      p user
      p new_matches
      if ( user.measurement == nil ) || (user.match == {}) || (new_matches = {})
      else
        MatchMailer.match_email(user, new_matches).deliver_now
      end
    end
  end

end


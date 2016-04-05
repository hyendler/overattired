class ScrapingWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # For TESTING purposes only - uncomment the following(in UTC):
  # recurrence { hourly.minute_of_hour(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55) }
  # recurrence { daily.hour_of_day(4).minute_of_hour(0) }

  # runs ScrapingWorker 9:00 AM daily:
  recurrence { daily.hour_of_day(16) }


  def perform
  	# this will scrape from etsy
  	store_data_from_etsy
    # this sends emails to users
  	mail_users
  end


  def mail_users
    all_users = User.where(:admin => false)
    # for all users, if the user is not admin
    # => if the measurement is nil or the user has no matches via user.match or if get_new_matches returns empty hash as well, don't send
    #   else send the email
    all_users.each do |user|
      new_matches = user.get_new_matches
      if user.measurement == nil
      elsif user.match == {}
      elsif new_matches == {}
      else
        MatchMailer.match_email(user, new_matches).deliver_now
      end
    end
  end

end




class ScrapingWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # this is UTC
  # this is used for testing purposes
  # UNCOMMENT THIS WHEN YOU ARE TESTING:
  recurrence { hourly.minute_of_hour(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55) }
  # recurrence { daily.hour_of_day(4).minute_of_hour(0) }



  # this is the official time 9:00 to be send out daily:
  # UNCOMMENT THIS WHEN LIVE:
  # recurrence { daily.hour_of_day(16) }



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
    all_users = User.where(:admin => false)
    # for all users, if the user is not admin
    # => if the measurement is nil or the user has no matches via user.match or if get_new_matches returns empty hash as well, don't send
    #   else send the email

    all_users.each do |user|
      new_matches = user.get_new_matches
      p  "*" * 50
      p "The mail_users method in scraping_workers.rb is running!"
      # p "The following are results of new_matches or user.get_new_matches:"
      # p new_matches
      if user.measurement == nil
        p "This user will NOT get an email because they have no measurement."
        p user
        p new_matches
      elsif user.match == {}
        p "This user will NOT get an email because they have no match objects."
        p user
        p new_matches
      elsif new_matches = {}
        p "This user will NOT get an email because get_new_matches return no new products."
        p user
        p new_matches
      else
        p "This user should get an email:"
        p user
        p "These matches should be in the email:"
        p new_matches
        MatchMailer.match_email(user, new_matches).deliver_now
      end
    end
  end

end


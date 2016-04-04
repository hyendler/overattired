

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
    p "@" * 50
    p "The 'perform' method in worker/scraping_worker.rb is now running."
  	# this just sends out something that says - can delete
  	testing_method
    p "%" * 50
    p "The 'testing_method' method in worker/scraping_worker.rb is now running a test message."
  	# this will scrape from etsy
  	store_data_from_etsy
    p "#" * 50
    p "The 'store_data_from_etsy' method in worker/scraping_worker.rb has just ended"
    p "ETSY HAS BEEN SCRAPED!"
  	# this will send email to users
  	mail_users
    p "&"*50
    p "The 'mail_users' method in worker/scraping_worker.rb is now running"
    # implementation details...
    p "%" * 50
    p "DONE!!!!!"
  end


  def mail_users
    p "the 'mail_users' method is located in worker/scraping_worker.rb and sends a match email to users if they have new matches"
    all_users = User.where(:admin => false)
    p all_users
    # for all users, if the user is not admin
    # => if the measurement is nil or the user has no matches via user.match or if get_new_matches returns empty hash as well, don't send
    #   else send the email
    p "Now starting the loop and running through each user to find out if the user has any new product matches"
    all_users.each do |user|
      new_matches = user.get_new_matches
      p new_matches
      # p "The following are results of new_matches or user.get_new_matches:"
      # p new_matches
      if user.measurement == nil
        p "This user will NOT get an email because they have no measurement."
        p user
      elsif user.match == {}
        p "This user will NOT get an email because they have no match objects."
        p user
      elsif new_matches == {}
        p "This user will NOT get an email because get_new_matches return no new products."
        p user
      else
        p "This user should get an email:"
        p user
        p "These matches should be in the email:"
        MatchMailer.match_email(user, new_matches).deliver_now
        p "an email has just been sent out"
      end
    end
  end

end


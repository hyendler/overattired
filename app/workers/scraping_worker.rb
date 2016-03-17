class ScrapingWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # this is UTC
  recurrence { daily.hour_of_day(4).minute_of_hour(43) }


  def perform
  	# this just sends out something that says 
  	testing_method
    # implementation details...
  end
end
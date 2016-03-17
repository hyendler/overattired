class ScrapingWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily.hour_of_day(1).minute_of_hour(55) }


  def perform
  	testing_method
    # implementation details...
  end
end
class ScrapingWorker
  include Sidekiq::Worker
 

  def perform
  	testing_method
    # implementation details...
  end
end
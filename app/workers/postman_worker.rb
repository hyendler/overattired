require 'sidekiq'

class PostmanWorker
  include Sidekiq::Worker

  def perform(h, count)
    # THIS LINE TELL YOU THAT THIS PERFORM HAS RAN
  	p "POSTMAN WORKER"
    UserMailer.contact_email(h['name'], h['email']).deliver
  end
end

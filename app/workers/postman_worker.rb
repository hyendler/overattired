require 'sidekiq'

class PostmanWorker
  include Sidekiq::Worker

  def perform(h, count)
  	p "HELO KITTY " * 50
    UserMailer.contact_email(h['name'], h['email']).deliver
  end
end
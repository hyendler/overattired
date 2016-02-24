class PostmanWorker
  include Sidekiq::Worker

  def perform(h, count)
    VisitorMailer.contact_email(h['name'], h['email']).deliver
  end
end
class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL_EMAIL_DEV']
  layout 'mailer'
end

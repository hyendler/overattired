class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL_EMAIL_PROD']
  layout 'mailer'
end

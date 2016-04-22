class MatchMailer < ApplicationMailer
  default from: ENV['GMAIL_EMAIL_PROD']

   def match_email(user, new_matches)
    @user = user
    @new_matches = new_matches
  	mail(to: @user.email, subject: "Hola #{@user.first_name}! Here are your matches!")
  end
  
end
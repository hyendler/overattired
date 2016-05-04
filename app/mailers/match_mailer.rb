class MatchMailer < ApplicationMailer
  default from: 'overattired1@gmail.com'

   def match_email(user, new_matches)
    @user = user
    @new_matches = new_matches
  	mail(to: @user.email, subject: "Hola #{@user.first_name}! Here are your matches!")
  end
  
end
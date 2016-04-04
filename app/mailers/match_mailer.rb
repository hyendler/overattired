class MatchMailer < ApplicationMailer
  default from: 'overattired1@gmail.com'

   def match_email(user, new_matches)
    @user = user
    @new_matches = new_matches
  	mail(to: @user.email, subject: "Overattired's New Matches for you, #{@user.first_name}! ")
  end
  
end
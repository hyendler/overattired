class MatchMailer < ApplicationMailer
  default from: 'overattired1@gmail.com'

   def match_email(user)
    @user = user
  	mail(to: @user.email, subject: "Heya #{@user.first_name}! Here are your matches!")
  end
  
end
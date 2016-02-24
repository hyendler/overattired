class MatchMailer < ApplicationMailer
  default from: 'overattired1@gmail.com'

   def match_email(user)
  	@user = User.last
  		mail(to: "reginawong14@gmail.com", subject: 'Here are your matches!')
  end
  
end
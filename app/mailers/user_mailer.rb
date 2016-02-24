class UserMailer < ApplicationMailer
  default from: 'overattired1@gmail.com'

  def welcome_email(user)
  	@user = user
  	@url = 'http://overattired.com'
  	
  	mail(to: @user.email, subject: 'Welcome to Over Attired!')
  

   def send_updates(user)
  	@users = User.all
  	@users.each do |user|
  		mail(to: user.email, subject: 'Here are your matches!')
  	end
  end
  

end

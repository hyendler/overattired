class UserMailer < ApplicationMailer
  default from: 'letthewookiewin13@gmail.com'
	 
  def sample_email(user)
    @user = user
#     @url  = 'http://overattired.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

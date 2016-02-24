class UserMailer < ApplicationMailer
  default from: 'overattired1@gmail.com'

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(from: @email,
         to: 'reginawong14@gmail.com',
         subject: 'Welcome E-mail!')
  end

  # def welcome_email(user)
  # 	@user = user
  # 	@url = 'http://overattired.com'
  # 	mail(to: @user.email, subject: 'Welcome to Over Attired!')
  # end

end

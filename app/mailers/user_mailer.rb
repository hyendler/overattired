class UserMailer < ApplicationMailer
  default from: 'overattired1@gmail.com'

  def contact_email(name, email)
    @user = User.find_by_email(email)
    @name = name
    @email = email
    mail(from: 'overattired1@gmail.com',
         to: 'reginawong14@gmail.com',
         subject: 'Welcome E-mail!')
  end

  # def welcome_email(user)
  # 	@user = user
  # 	@url = 'http://overattired.com'
  # 	mail(to: @user.email, subject: 'Welcome to Over Attired!')
  # end

end

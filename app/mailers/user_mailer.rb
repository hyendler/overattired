class UserMailer < ApplicationMailer
  default from: 'overattired1@gmail.com'

  def contact_email(name, email)
    # THIS METHOD RAN IF YOU DO THIS
    #p "the contact_email method has been called"
    #p "COFFEE" * 50
    @name = name
    @email = email
    @user = User.find_by_email(email)
    @matches = @user.match
    # THIS SHOULD BE SAM'S STORE EMAIL
    mail(from: 'overattired1@gmail.com',
        # NEED TO CHANGE THIS SO IT GOES TO ALL USERS
         to: 'reginawong14@gmail.com',
         subject: 'Welcome E-mail!')
  end

end

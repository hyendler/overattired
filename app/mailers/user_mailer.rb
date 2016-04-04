# Welcome E-mail

class UserMailer < ApplicationMailer
  default from: 'overattired1@gmail.com'

  def contact_email(name, email)
    # THIS METHOD RAN IF YOU DO THIS
    #p "the contact_email method has been called"
    #p "COFFEE" * 50
    @name = name
    @email = email
    @user = User.find_by_email(email)
    @matches = @user.get_initial_matches
    # THIS SHOULD BE SAM'S STORE EMAIL
    mail(from: 'overattired1@gmail.com',
        # NEED TO CHANGE THIS SO IT GOES TO ALL USERS
         to: "#{@email}",
         subject: "Welcome to Overattired!")
  end

end

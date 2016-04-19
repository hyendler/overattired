# Welcome E-mail

class UserMailer < ApplicationMailer
  default from: ENV['GMAIL_EMAIL_DEV']

  def contact_email(name, email)
    # THIS METHOD RAN IF YOU DO THIS
    p "contact_email in User Mailer"
    #p "COFFEE" * 50
    @name = name
    @email = email
    @user = User.find_by_email(email)
    p "USER"
    p @user
    @matches = @user.get_initial_matches
    # THIS SHOULD BE SAM'S STORE EMAIL
    mail(from: ENV['GMAIL_EMAIL_DEV'],
        # NEED TO CHANGE THIS SO IT GOES TO ALL USERS
         to: "#{@email}",
         subject: "Welcome E-mail!")
  end

end

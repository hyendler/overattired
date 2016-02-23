class ExampleMailer < ActionMailer::Base
  default from: "letthewookiewin13@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
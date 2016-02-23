class RegistrationsController < Devise::RegistrationsController
  after_action :send_user_mail, only: [:create]
  protected

  def send_user_mail
    UserMailer.welcome_email(@user).deliver_now
  end

  def after_sign_up_path_for(resource)
    new_user_measurement_path(current_user)
  end
end

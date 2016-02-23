class RegistrationsController < Devise::RegistrationsController
  
  protected

  def after_sign_up_path_for(resource)
    new_user_measurement_path(current_user)
  end
end

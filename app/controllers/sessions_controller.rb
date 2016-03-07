class SessionsController < Devise::SessionsController
	def after_sign_in_path_for(resource)
		if resource.admin
			admin_path
		elsif !current_user.measurement
      new_user_user_measurement_path(current_user.id)
    else
      user_path(current_user.id)
		end
	end
end

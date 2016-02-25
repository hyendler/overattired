class SessionsController < Devise::SessionsController
	def after_sign_in_path_for(resource)
		if resource.admin
			admin_path
		else
			user_path(current_user.id)
		end
	end
end

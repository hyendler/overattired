class Admin::BaseController < ApplicationController

  def verify_admin
    (current_user.nil?) ? (redirect_to(root_path)) : (redirect_to(root_path)) unless current_user.admin?
  end

end

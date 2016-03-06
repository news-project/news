class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # for admin
  def authenticate_admin_user!
    if current_admin_user
      authenticate_user!
    else
      redirect_to root
    end
  end

  def current_admin_user
    current_user && current_user.admin?
  end
end

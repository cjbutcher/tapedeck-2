class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def reject_request!
    raise "User is not authorized"
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end

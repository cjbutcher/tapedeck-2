class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def reject_request!
    raise "User is not authorized"
  end
end

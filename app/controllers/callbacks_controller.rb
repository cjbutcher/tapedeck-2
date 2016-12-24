class CallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth = request.env["omniauth.auth"]
    Rails.logger.info(auth.inspect)
    # @user = User.from_omniauth(auth)
    # sign_in_and_redirect @user
  end

end

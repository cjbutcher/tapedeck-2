class CallbacksController < Devise::OmniauthCallbacksController

  def facebook
    register_or_sign_in
  end

  def twitter
    register_or_sign_in
  end

  private

  def register_or_sign_in
    auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth)
    sign_in_and_redirect @user
  end

end

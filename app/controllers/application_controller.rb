class ApplicationController < ActionController::Base
  helper_method :current_user
  auto_session_timeout 15.minutes

  def current_user
    return unless session[:user_id]

    @_current_user = User.find_by(user_id: session[:user_id])
  end
end

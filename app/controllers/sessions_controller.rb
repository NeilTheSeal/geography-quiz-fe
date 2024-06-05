class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    target_url = Google::Auth::WebUserAuthorizer.handle_auth_callback_deferred(request)
    redirect target_url
  end

  def new
    id = Google::Auth::ClientId.new(
      Rails.application.credentials.google[:client_id],
      Rails.application.credentials.google[:client_secret]
    ).id
    audience = id
    claim = Google::Auth::IDTokens.verify_oidc(
      params["credential"],
      aud: audience,
      azp: audience
    )
    if claim
      User.find_or_create_by(
        user_id: claim["sub"],
        name: claim["name"]
      )
      session[:user_name] = claim["name"]
      session[:user_id] = claim["sub"]
      session[:user_email] = claim["email"]
      redirect_to "/dashboard"
    else
      logger.info("No valid identity token present")
      401
    end
  end

  def destroy
    session.clear
    redirect_to "/"
  end
end

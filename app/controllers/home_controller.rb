class HomeController < ApplicationController
  def index
    @client_id = Rails.application.credentials.google[:client_id]
    return unless current_user

    redirect_to dashboard_path
  end
end

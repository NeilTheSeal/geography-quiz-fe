class HomeController < ApplicationController
  def index
    @client_id = Rails.application.credentials.google[:client_id]
  end
end

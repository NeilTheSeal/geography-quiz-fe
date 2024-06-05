class DashboardController < ApplicationController
  def index
    @user = User.find_by(user_id: session[:user_id])
  end
end

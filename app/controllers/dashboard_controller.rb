class DashboardController < ApplicationController
  def index
    user = User.find_by(user_id: session[:user_id])

    unless user
      redirect_to root_path
      return
    end

    @facade = DashboardFacade.new(user)
  end
end

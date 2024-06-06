class DashboardController < ApplicationController
  def index
    @user = User.find_by(user_id: session[:user_id])

    unless @user
      redirect_to root_path
      return
    end

    @previous_scores = @user.previous_scores
    @high_scores = ScoresService.high_scores
  end
end

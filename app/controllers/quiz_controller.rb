class QuizController < ApplicationController
  def index
    @facade = QuizFacade.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    QuizService.new.create_score(params[:score], session[:user_id])
  end
end

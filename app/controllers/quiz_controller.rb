class QuizController < ApplicationController
  def index
    @questions = QuizService.new.retrieve_questions
    @be_url = Rails.env.production? ? "https://ancient-plains-68209-663b50393b93.herokuapp.com/api/v0/high-scores" : "http://localhost:5000/api/v0/high-scores"
  end

  def create
    @user = User.find_by(id: session[:user_id])
    QuizService.new.create_score(params[:score], session[:user_id])
  end
end

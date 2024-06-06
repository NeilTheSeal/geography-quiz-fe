class QuizFacade
  attr_reader :questions, :submit_url

  def initialize
    @questions = QuizService.new.retrieve_questions

    if Rails.env.production?
      @submit_url = "https://ancient-plains-68209-663b50393b93.herokuapp.com/api/v0/high-scores"
    else
      @submit_url = "http://localhost:5000/api/v0/high-scores"
    end
  end
end

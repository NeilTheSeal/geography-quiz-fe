class QuizService
  def initialize
    @host = if ENV["RAILS_ENV"] == "production"
              "https://ancient-plains-68209-663b50393b93.herokuapp.com"
            else
              "http://localhost:5000"
            end
  end

  def create_score(number_correct, user_id)
    conn = faraday_connection

    conn.post(
      "/api/v0/high-scores",
      { number_correct:, user_id: }
    )

    redirect_to dashboard_path
  end

  def retrieve_questions
    json = questions_as_json

    json[:data].map do |score_data|
      {
        id: score_data[:id],
        question: score_data[:attributes][:question],
        correct_answer: score_data[:attributes][:correct_answer],
        options: score_data[:attributes][:options],
        image: score_data[:attributes][:image]
      }
    end
  end

  private

  def questions_as_json
    conn = faraday_connection
    response = conn.get("/api/v0/quiz-questions")

    JSON.parse(response.body, symbolize_names: true)
  end

  def faraday_connection
    Faraday.new(url: @host) do |faraday|
      faraday.headers["Accept"] = "application/json"
    end
  end
end

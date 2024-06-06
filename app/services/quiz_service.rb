class QuizService
  def initialize
    if ENV["RAILS_ENV"] == "production"
      @host = "https://ancient-plains-68209-663b50393b93.herokuapp.com"
    else
      @host = "http://localhost:5000"
    end
  end

  def create_score(number_correct, user_id)
    conn = Faraday.new(url: @host) do |faraday|
      faraday.headers["Accept"] = "application/json"
    end

    response = conn.post("/api/v0/high-scores", { number_correct: number_correct, user_id: user_id })
    json = JSON.parse(response.body, symbolize_names: true)

    p json[:data]

    redirect_to dashboard_path
  end

  def retrieve_questions
    conn = Faraday.new(url: @host) do |faraday|
      faraday.headers["Accept"] = "application/json"
    end

    response = conn.get("/api/v0/quiz-questions")
    json = JSON.parse(response.body, symbolize_names: true)

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
end

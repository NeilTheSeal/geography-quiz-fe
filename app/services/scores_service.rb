class ScoresService
  def initialize(user_id)
    @user_id = user_id
  end

  def previous_scores
    previous_scores_as_json[:data].map do |score_data|
      {
        number_correct: score_data[:attributes][:number_correct],
        created_at: score_data[:attributes][:created_at]
      }
    end
  end

  def self.high_scores
    high_scores_as_json[:data].map do |score_data|
      {
        number_correct: score_data[:attributes][:number_correct],
        name: User.find_by(user_id: score_data[:attributes][:user_id]).name,
        created_at: score_data[:attributes][:created_at]
      }
    end
  end

  def self.high_scores_as_json
    host = ScoresService.host
    conn = ScoresService.high_scores_faraday_connection(host)
    response = conn.get("/api/v0/high-scores")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.host
    if ENV["RAILS_ENV"] == "production"
      "https://ancient-plains-68209-663b50393b93.herokuapp.com"
    else
      "http://localhost:5000"
    end
  end

  def self.high_scores_faraday_connection(host)
    Faraday.new(url: host) do |faraday|
      faraday.headers["Accept"] = "application/json"
    end
  end

  private

  def previous_scores_as_json
    conn = previous_scores_faraday_connection
    response = conn.get("/api/v0/previous-scores")

    JSON.parse(response.body, symbolize_names: true)
  end

  def previous_scores_faraday_connection
    Faraday.new(url: ScoresService.host) do |faraday|
      faraday.headers["Accept"] = "application/json"
      faraday.params["user_id"] = @user_id
    end
  end
end

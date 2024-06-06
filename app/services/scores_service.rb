class ScoresService
  def initialize(user_id)
    @user_id = user_id
  end

  def previous_scores
    conn = Faraday.new(url: "http://localhost:5000") do |faraday|
      faraday.headers["Accept"] = "application/json"
      faraday.params["user_id"] = @user_id
    end

    response = conn.get("/api/v0/previous-scores")
    json = JSON.parse(response.body, symbolize_names: true)

    json[:data].map do |score_data|
      score_data[:attributes][:number_correct]
    end
  end

  def self.high_scores
    conn = Faraday.new(url: "http://localhost:5000") do |faraday|
      faraday.headers["Accept"] = "application/json"
    end

    response = conn.get("/api/v0/high-scores")
    json = JSON.parse(response.body, symbolize_names: true)

    json[:data].map do |score_data|
      {
        number_correct: score_data[:attributes][:number_correct],
        name: User.find_by(user_id: score_data[:attributes][:user_id]).name
      }
    end
  end
end

class ScoresService
  def initialize(user_id)
    @user_id = user_id
    @host = if ENV["RAILS_ENV"] == "production"
              "https://ancient-plains-68209-663b50393b93.herokuapp.com"
            else
              "http://localhost:5000"
            end
  end

  def previous_scores
    json = previous_scores_as_json

    json[:data].map do |score_data|
      {
        number_correct: score_data[:attributes][:number_correct],
        created_at: score_data[:attributes][:created_at]
      }
    end
  end

  def self.high_scores
    json = high_scores_as_json

    json[:data].map do |score_data|
      {
        number_correct: score_data[:attributes][:number_correct],
        name: User.find_by(user_id: score_data[:attributes][:user_id]).name,
        created_at: score_data[:attributes][:created_at]
      }
    end
  end

  def self.high_scores_as_json
    host = if ENV["RAILS_ENV"] == "production"
             "https://ancient-plains-68209-663b50393b93.herokuapp.com"
           else
             "http://localhost:5000"
           end

    conn = Faraday.new(url: host) do |faraday|
      faraday.headers["Accept"] = "application/json"
    end

    response = conn.get("/api/v0/high-scores")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def previous_scores_as_json
    conn = Faraday.new(url: @host) do |faraday|
      faraday.headers["Accept"] = "application/json"
      faraday.params["user_id"] = @user_id
    end

    response = conn.get("/api/v0/previous-scores")
    JSON.parse(response.body, symbolize_names: true)
  end
end

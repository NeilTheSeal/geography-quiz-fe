class User < ApplicationRecord
  validates_presence_of :user_id, :name

  def previous_scores
    ScoresService.new(user_id).previous_scores
  end
end

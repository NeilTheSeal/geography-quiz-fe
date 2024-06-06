class DashboardFacade
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def previous_scores
    @user.previous_scores
  end

  def high_scores
    ScoresService.high_scores
  end
end

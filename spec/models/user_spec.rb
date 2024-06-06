require "rails_helper"

RSpec.describe User, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :name }

  it "shows previous scores" do 
    user_1 = create(:user, user_id: "1")
    user_2 = create(:user, user_id: "2")
    user_3 = create(:user, user_id: "3")

    expect(user_1.previous_scores.first[:number_correct]).to eq(20)
    expect(user_1.previous_scores.last[:number_correct]).to eq(14)
  end
end

require 'rails_helper'

RSpec.describe 'high_scores_list' do
  before(:each) do
    @user_1 = create(:user, user_id: "1")
    @user_2 = create(:user, user_id: "2")
    @user_3 = create(:user, user_id: "3")
  end

  it 'shows the high scores list' do
    page.set_rack_session(user_id: @user_1.user_id, name: @user_1.name)
    visit "/dashboard"

    within '#high-scores' do
      expect(@user_1.name).to appear_before(@user_2.name)
      expect(@user_2.name).to appear_before(@user_3.name)
      expect(page).to have_css(".entry", count: 10)
    end
  end
end
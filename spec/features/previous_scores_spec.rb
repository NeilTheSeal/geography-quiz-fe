require 'rails_helper'

RSpec.describe 'previous_scores' do
  before(:each) do
    @user_1 = create(:user, user_id: "1")
    @user_2 = create(:user, user_id: "2")
    @user_3 = create(:user, user_id: "3")

  end

  it 'shows the previous scores' do
    page.set_rack_session(user_id: @user_1.user_id, name: @user_1.name)
    visit "/dashboard"

    within '#previous-scores' do
      expect(page).to have_content("20 / 20")
      expect(page).to have_content("18 / 20")
      expect(page).to have_content("16 / 20")
      expect(page).to have_content("14 / 20")
      expect(page).to have_css(".entry", count: 4)
    end
  end
end
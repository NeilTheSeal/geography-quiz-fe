require 'rails_helper'

RSpec.describe 'previous_scores' do
  before(:each) do
    @user = create(:user, user_id: "1")
  end

  it 'shows the previous scores' do
    page.set_rack_session(user_id: @user.user_id, name: @user.name)
    visit "/dashboard"

    within '#previous-scores' do
      expect(page).to have_css(".previous-score", count: 4)
    end
  end
end
require "rails_helper"

RSpec.describe "Dashboard" do
  before(:each) do
    @user_1 = create(:user, user_id: "1")
    @user_2 = create(:user, user_id: "2")
    @user_3 = create(:user, user_id: "3")
  end

  it "redirects if not logged in" do
    visit "/dashboard"

    expect(current_path).to eq("/")
  end
end
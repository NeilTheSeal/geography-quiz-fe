require "rails_helper"

RSpec.describe "home" do
  before(:each) do
    @user_1 = create(:user, user_id: "1")
    @user_2 = create(:user, user_id: "2")
    @user_3 = create(:user, user_id: "3")
  end

  it "redirects if not logged in" do
    page.set_rack_session(user_id: @user_1.user_id, name: @user_1.name)

    visit "/"

    expect(current_path).to eq("/dashboard")
  end
end

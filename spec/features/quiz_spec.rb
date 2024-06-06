require "rails_helper"

RSpec.describe "Quiz Page" do
  before(:each) do
    @user_1 = create(:user, user_id: "1")
    @user_2 = create(:user, user_id: "2")
    @user_3 = create(:user, user_id: "3")

    page.set_rack_session(user_id: @user_1.user_id, name: @user_1.name)

    visit "/quiz"
  end

  it "shows the first question" do
    expect(find(".question-text").text.empty?).to eq(false)
    expect(find("#question-0").nil?).to eq(false)
  end

  it "shows the next question when the user answers the current question" do
    all('input[type="radio"]')[0].click
    click_button "see answer"
  end
end

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

  it "shows the answer then next question when the user answers the current question" do
    question_text = find(".question-text").text

    all('input[type="radio"]')[0].click
    click_button "see answer"

    # Capybara does not execute JavaScript -
    # not sure how to write the rest of this test
  end

  it "can return to dashboard" do
    click_link "Dashboard"

    expect(current_path).to eq("/dashboard")
  end

  it "can sign out" do
    click_link "Sign Out"

    expect(current_path).to eq("/")
  end
end

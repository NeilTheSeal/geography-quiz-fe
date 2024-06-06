require "rails_helper"

RSpec.describe ApplicationController, type: :feature do

  describe '#current_user' do
    xit 'validates a session' do
      user = create(:user, user_id: "1")
      page.set_rack_session(user_id: user.user_id, name: user.name)

      expect(current_user.nil?).to eq(false)
      #not really sure how test for this helper method current_user 
    end
  end
end
class UsersController < ApplicationController
  def user_valid
    valid = !User.find_by(user_params).nil?
    render json: valid
  end

  private

  def user_params
    params.permit(:user_id)
  end
end

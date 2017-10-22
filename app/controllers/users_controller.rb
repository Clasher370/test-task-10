class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'Created successfully!' }, status: :created
    else
      render json: @user.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:nickname,
                  :email,
                  :password,
                  :password_confirmation)
  end
end

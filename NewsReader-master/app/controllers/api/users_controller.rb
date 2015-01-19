class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      render json: @user
    else
      #render json: @user.errors.full_messages, status: 422
      render json: user_params, status: 422
    end
  end

  def show
    render json: User.find(params[:id]), include: :feeds

  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end

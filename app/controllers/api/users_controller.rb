class Api::UsersController < ApplicationController

  # sign up
  def create
    @user = User.new(user_params)
    # debugger;
    if @user.save
      log_in!(@user)
      ### issue???
      render `api/users/show`
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def edit
    @user = User.find(params[:id])
    render `api/users/show`
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render `api/users/show`
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end

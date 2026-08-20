class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to public_user_path, notice: "プロフィールを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def unsubscribe
  end

  def withdraw
    current_user.destroy
    reset_session

    redirect_to root_path, notice: "退会しました。"
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :introduction,
      :acting_experience,
      :singing_experience,
      :dance_experience,
      :preferred_area
    )
  end
end
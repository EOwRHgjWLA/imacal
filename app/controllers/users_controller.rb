class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @parties = @user.parties.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to parties_path
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end

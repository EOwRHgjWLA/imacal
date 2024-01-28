class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:create, :destroy]

  def create
    @party = Party.find(params[:party_id])
    current_user.likes(@party)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @party = Party.find(params[:party_id])
    current_user.unlikes(@party)
    respond_to do |format|
      format.js
    end
  end

private

  def check_user
    if current_user.nil? || current_user.guest?
      flash[:alert] = 'ログインユーザー以外はいいね機能を使用できません。'
      redirect_back(fallback_location: root_path)
    end
  end

end

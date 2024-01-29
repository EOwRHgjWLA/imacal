class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @party = Party.find(params[:party_id])
    @like = current_user.likes.build(party: @party)
    @like.save
  end

  def destroy
    @party = Party.find(params[:party_id])
    @like = current_user.likes.find_by(party: @party)
    @like.destroy
  end

private

  def check_user
    if current_user.nil? || current_user.guest?
      flash[:alert] = 'ログインユーザー以外はいいね機能を使用できません。'
      redirect_back(fallback_location: root_path)
    end
  end

end

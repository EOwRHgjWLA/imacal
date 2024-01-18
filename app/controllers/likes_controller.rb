class LikesController < ApplicationController

  def create
    party = Party.find(params[:party_id])
    like = current_user.likes.new(party_id: party.id)
    like.save
    redirect_to party_path(party)
  end

  def destroy
    party = Party.find(params[:party_id])
    like = current_user.likes.find_by(party_id: party.id)
    like.destroy
    redirect_to party_path(party)
  end

end

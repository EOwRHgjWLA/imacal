class CommentsController < ApplicationController

  def create
    party = Party.find(params[:party_id])
    comment = current_user.comments.new(comment_params)
    comment.party_id = party.id
    comment.save
    redirect_to party_path(party)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to party_path(params[:party_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
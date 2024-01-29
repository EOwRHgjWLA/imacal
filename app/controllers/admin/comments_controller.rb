class Admin:: CommentsController < ApplicationController

  def index
    @comments = Comment.all
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
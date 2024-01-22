class PartiesController < ApplicationController

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    @party.user_id = current_user.id
    if @party.save
      redirect_to parties_path
    else
      render :new
    end
  end

  def index
    @parties = Party.page(params[:page]) || []
  end

  def show
    @party = Party.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    party = Party.find(params[:id])
    party.destroy
    redirect_to '/party'
  end

  private

  def party_params
    params.require(:party).permit(:name,
                                  :introduction,
                                  :image,
                                  :turn_number,
                                  :enemy_defence,
                                  :airship,
                                  :reactor,
                                  :weekness,
                                  :attacks,
                                  :remainding_hp,
                                  :optimus,
                                  :optimus_friend,
                                  :omega,
                                  :omega_friend,
                                  :element,
                                  :element_friend)
  end

end

class PartiesController < ApplicationController

  def new
    @party = Party.new
    @weapons = Weapon.all
  end

  def create
    @party = Party.new(party_params)
    @party.user = current_user

    tag_ids = params[:party][:tag_ids].reject(&:blank?)
    new_tags = params[:party][:new_tags].split(',').map(&:strip)

    tag_ids += new_tags.map { |tag_name| Tag.find_or_create_by(name: tag_name).id }
    @party.tag_ids = tag_ids

    if @party.save
      redirect_to @party, notice: '新しい編成が作成されました。'
    else
      puts @party.errors.full_messages
      @weapons = Weapon.all
      render :new
    end
  end

  def index
    @parties = Party.page(params[:page]) || []
  end

  def edit
    @party = Party.find(params[:id])
    @weapons = Weapon.all
  end

  def update
    @party = Party.find(params[:id])
    if @party.update(party_params)
      redirect_to party_path(@party), notice: '記事が更新されました'
    else
      render :edit
    end
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
                                  :own_summon_type,
                                  :own_summon_buff,
                                  :friend_summon_type,
                                  :friend_summon_buff,
                                  :weapon_id,
                                  :new_tags,
                                  tag_ids: [], new_tags: [],
                                  party_weapons_attributes: [:id, :weapon_id, :_destroy],
                                  weapons_attributes: [
                                    :id, :weapon_id, :_destroy,
                                    :name, :attack, :hitpoint, :element, :weapontype,
                                    :optimus_might, :optimus_betrayal, :preemptive, :mutinys, :bahamut,
                                    :optimus_enmity, :zeal_enmity, :optimus_stamina, :strength_stamina,
                                    :omega_might, :omega_betrayal, :omega_enmity, :omega_stamina,
                                    :ex_might, :ex_might_sp, :eclipse, :optimus_verity, :omega_verity]
                                    )
  end

end

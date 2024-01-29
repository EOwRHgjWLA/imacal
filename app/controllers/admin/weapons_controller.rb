class Admin::WeaponsController < ApplicationController

  def index
    @weapons = Weapon.page(params[:page]).per(10)
  end

  def new
    @weapon = Weapon.new
  end

  def create
    @weapon = Weapon.new(weapon_params)
    if @weapon.save
      redirect_to admin_weapons_path, notice: '武器が追加されました'
    else
      render :new
    end
  end

  def edit
    @weapon = Weapon.find(params[:id])
  end

  def update
    @weapon = Weapon.find(params[:id])
    if @weapon.update(weapon_params)
      redirect_to admin_weapons_path, notice: '武器が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @weapon = Weapon.find(params[:id])
    @weapon.destroy
    redirect_to admin_weapons_path, notice: '武器が削除されました'
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name,
                                   :attack,
                                   :hitpoint,
                                   :element,
                                   :weapontype,
                                   :optimus_might,
                                   :optimus_betrayal,
                                   :preemptive,
                                   :mutinys,
                                   :bahamut,
                                   :optimus_enmity,
                                   :zeal_enmity,
                                   :optimus_stamina,
                                   :strength_stamina,
                                   :omega_might,
                                   :omega_betrayal,
                                   :omega_enmity,
                                   :omega_stamina,
                                   :ex_might,
                                   :ex_might_sp,
                                   :eclipse,
                                   :optimus_verity,
                                   :omega_verity
                                   )
  end

end
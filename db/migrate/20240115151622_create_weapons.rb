class CreateWeapons < ActiveRecord::Migration[6.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :attack
      t.integer :hitpoint
      t.string :element
      t.string :weapontype
      t.numeric :optimus_might
      t.numeric :optimus_betrayal
      t.numeric :preemptive
      t.numeric :mutinys
      t.numeric :bahamut
      t.numeric :optimus_enmity
      t.numeric :zeal_enmity
      t.numeric :optimus_stamina
      t.numeric :strength_stamina
      t.numeric :omega_might
      t.numeric :omega_betrayal
      t.numeric :omega_enmity
      t.numeric :omega_stamina
      t.numeric :ex_might
      t.numeric :ex_might_sp
      t.numeric :eclipse
      t.numeric :optimus_verity
      t.numeric :omega_verity
      t.timestamps
    end
  end
end

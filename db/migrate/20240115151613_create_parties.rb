class CreateParties < ActiveRecord::Migration[6.1]
  def change
    create_table :parties do |t|
      t.integer :weapon_id
      t.string :name
      t.text :introduction
      t.integer :turn_number
      t.integer :enemy_defence
      t.integer :airship
      t.integer :reactor
      t.integer :weekness
      t.integer :attacks
      t.integer :remainding_hp
      t.integer :optimus
      t.integer :optimus_friend
      t.integer :omega
      t.integer :omega_friend
      t.integer :element
      t.integer :element_friend
      t.timestamps
    end
  end
end

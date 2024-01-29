class CreateParties < ActiveRecord::Migration[6.1]
  def change
    create_table :parties do |t|
      t.integer :weapon_id
      t.integer :user_id
      t.string :name
      t.text :introduction
      t.integer :turn_number
      t.integer :enemy_defence
      t.string :airship
      t.string :reactor
      t.string :weekness
      t.integer :attacks
      t.string :remainding_hp
      t.string :own_summon_type
      t.integer :own_summon_buff
      t.string :friend_summon_type
      t.integer :friend_summon_buff
      t.timestamps
    end
  end
end

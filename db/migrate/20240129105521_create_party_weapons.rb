class CreatePartyWeapons < ActiveRecord::Migration[6.1]
  def change
    create_table :party_weapons do |t|
      t.references :party, foreign_key: true
      t.references :weapon, foreign_key: true
      t.timestamps
    end
  end
end

class AddPartyIdToPartytags < ActiveRecord::Migration[6.1]
  def change
    remove_column :partytags, :name
    add_column :partytags, :party_id, :integer
    add_column :partytags, :tag_id, :integer
  end
end

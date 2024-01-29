class AddDisplayNameToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :display_name, :string
  end
end

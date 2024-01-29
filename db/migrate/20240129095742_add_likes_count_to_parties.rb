class AddLikesCountToParties < ActiveRecord::Migration[6.1]
  def change
    add_column :parties, :likes_count, :integer, default: 0
  end
end

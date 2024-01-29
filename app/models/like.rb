class Like < ApplicationRecord

  belongs_to :user
  belongs_to :party

  validates :user_id, uniqueness: {scope: :party_id}

  after_create :update_party_likes_count
  after_destroy :update_party_likes_count

  private

  def update_party_likes_count
    party.update(likes_count: party.likes.count)
  end

end

class Party < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :party_weapons, dependent: :destroy
  has_many :weapons, through: :party_weapons
  accepts_nested_attributes_for :weapons
  accepts_nested_attributes_for :party_weapons, allow_destroy: true
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy


  has_many :partytags
  has_many :tags, through: :partytags
  accepts_nested_attributes_for :tags

  attr_accessor :new_tags

  def likes_count
    likes.count
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def likes?(party)
    likes.exists?(party_id: party.id) if party
  end

  def self.search_by_name(query)
    where("name LIKE ?", "%#{query}%")
  end

    GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      user.display_name = "guestuser"
      user.introduction = "ゲストログイン中"
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end

  def guest?
    false
  end


end

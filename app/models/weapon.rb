class Weapon < ApplicationRecord
  has_one_attached :image
  has_many :party_weapons
  has_many :parties, through: :party_weapons
end

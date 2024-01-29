class PartyWeapon < ApplicationRecord
  belongs_to :party
  belongs_to :weapon
end
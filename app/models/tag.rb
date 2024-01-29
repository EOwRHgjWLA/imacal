class Tag < ApplicationRecord
  has_many :partytags
  has_many :parties, through: :partytags

  def self.find_or_create_by_name(name)
    find_or_create_by(name: name)
  end

  def self.search_by_name(query)
    where("name LIKE ?", "%#{query}%")
  end

end

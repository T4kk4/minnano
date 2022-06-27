class City < ApplicationRecord
  has_many :tax_accountants

  def title
    self.city
  end

  def self.find_by_prefecture_and_city(prefecture, city)
    if prefecture.present? && city.present?
      where(prefecture: prefecture, city: city)
    elsif prefecture.present?
      where(prefecture: prefecture)
    else
      all
    end
  end
end

class TaxAccountant < ApplicationRecord
  belongs_to :city, optional: true
  validates :office_name, uniqueness: { scope: :location }

  def specialty_field_raw
    array_to_row(self.specialty_field)
  end

  def specialty_field_raw=(values)
    self.specialty_field = []
    row_to_array(self.specialty_field, values)
  end

  def specialty_industry_raw
    array_to_row(self.specialty_industry)
  end

  def specialty_industry_raw=(values)
    self.specialty_industry = []
    row_to_array(self.specialty_industry, values)
  end

  def handling_software_raw
    array_to_row(self.handling_software)
  end

  def handling_software_raw=(values)
    self.handling_software = []
    row_to_array(self.handling_software, values)
  end

  def self.find_by_industry_and_field(cities, industry, field, page)
    accounts = if industry.present? && field.present?
                 where(city: cities)
                     .where('specialty_field @> ARRAY[?]::varchar[]', field)
                     .where('specialty_industry @> ARRAY[?]::varchar[]', industry)
               elsif industry.present?
                 where(city: cities).where('specialty_industry @> ARRAY[?]::varchar[]', industry)
               elsif field.present?
                 where(city: cities).where('specialty_field @> ARRAY[?]::varchar[]', field)
               else
                 where(city: cities)
               end
    # accounts.order('detailed DESC').order('id ASC').page(page).per(20)
    accounts.order('priority DESC').order("image_url = ''").order('id ASC').order('detailed DESC').page(page).per(10)
  end
end

# frozen_string_literal: true

json.prefectures(@prefectures) do |prefecture|
  json.name prefecture[0]
  json.cities(prefecture[1]) do |city|
    json.id city.id
    json.name city.city
  end
end

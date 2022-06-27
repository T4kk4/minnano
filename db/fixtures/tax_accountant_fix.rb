cities = City.all
cities.each do |city|
  city.update(prefecture: '青森県') if city.prefecture == '青森'
  city.update(prefecture: '秋田県') if city.prefecture == '秋田'
  city.update(prefecture: '岩手県') if city.prefecture == '岩手'
  city.update(prefecture: '山形県') if city.prefecture == '山形'
  city.update(prefecture: '宮城県') if city.prefecture == '宮城'
  city.update(prefecture: '福島県') if city.prefecture == '福島'
  city.update(prefecture: '東京都') if city.prefecture == '東京'
  city.update(prefecture: '群馬県') if city.prefecture == '群馬'
  city.update(prefecture: '茨城県') if city.prefecture == '茨城'
  city.update(prefecture: '埼玉県') if city.prefecture == '埼玉'
  city.update(prefecture: '神奈川県') if city.prefecture == '神奈川'
  city.update(prefecture: '栃木県') if city.prefecture == '栃木'
  city.update(prefecture: '千葉県') if city.prefecture == '千葉'
  city.update(prefecture: '滋賀県') if city.prefecture == '滋賀'
  city.update(prefecture: '兵庫県') if city.prefecture == '兵庫'
  city.update(prefecture: '京都府') if city.prefecture == '京都'
  city.update(prefecture: '奈良県') if city.prefecture == '奈良'
  city.update(prefecture: '大阪府') if city.prefecture == '大阪'
  city.update(prefecture: '和歌山県') if city.prefecture == '和歌山'
  city.update(prefecture: '富山県') if city.prefecture == '富山'
  city.update(prefecture: '石川県') if city.prefecture == '石川'
  city.update(prefecture: '福井県') if city.prefecture == '福井'
  city.update(prefecture: '岐阜県') if city.prefecture == '岐阜'
  city.update(prefecture: '三重県') if city.prefecture == '三重'
  city.update(prefecture: '静岡県') if city.prefecture == '静岡'
  city.update(prefecture: '愛知県') if city.prefecture == '愛知'
  city.update(prefecture: '長野県') if city.prefecture == '長野'
  city.update(prefecture: '新潟県') if city.prefecture == '新潟'
  city.update(prefecture: '山梨県') if city.prefecture == '山梨'
  city.update(prefecture: '岡山県') if city.prefecture == '岡山'
  city.update(prefecture: '鳥取県') if city.prefecture == '鳥取'
  city.update(prefecture: '広島県') if city.prefecture == '広島'
  city.update(prefecture: '島根県') if city.prefecture == '島根'
  city.update(prefecture: '山口県') if city.prefecture == '山口'
  city.update(prefecture: '徳島県') if city.prefecture == '徳島'
  city.update(prefecture: '高知県') if city.prefecture == '高知'
  city.update(prefecture: '香川県') if city.prefecture == '香川'
  city.update(prefecture: '愛媛県') if city.prefecture == '愛媛'
  city.update(prefecture: '長崎県') if city.prefecture == '長崎'
  city.update(prefecture: '宮崎県') if city.prefecture == '宮崎'
  city.update(prefecture: '福岡県') if city.prefecture == '福岡'
  city.update(prefecture: '熊本県') if city.prefecture == '熊本'
  city.update(prefecture: '鹿児島県') if city.prefecture == '鹿児島'
  city.update(prefecture: '佐賀県') if city.prefecture == '佐賀'
  city.update(prefecture: '大分県') if city.prefecture == '大分'
  city.update(prefecture: '沖縄県') if city.prefecture == '沖縄'
end

cities = City.all
TaxAccountant.all.each do |tax_accountant|
  city_id = -1
  cities.each do |city|
    if tax_accountant.location.include?(city.prefecture) && tax_accountant.location.include?(city.city)
      city_id = city.id
      break
    end
  end

  if city_id == -1
    filtered_cities = cities.filter { |city| tax_accountant.location.include?(city.city) }
    if filtered_cities.length == 1
      city_id = filtered_cities[0].id
    end
  end

  if city_id == -1
    location = if tax_accountant.location.include?('〒')
                 tax_accountant.location.slice(10,3)
               else
                 tax_accountant.location.slice(0, 3)
               end
    filtered_cities = cities.filter { |city| location.include?(city.city) }
    if filtered_cities.length == 1
      city_id = filtered_cities[0].id
    end
  end

  tax_accountant.update(city_id: city_id)
end

namespace :scraping do
  desc 'scraping_tasks'

  task fix_city_name: :environment do
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
  end

  task fix_city: :environment do
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
  end

  task zeiri4_com_fetch: :environment do
    base_url = 'https://www.zeiri4.com'

    search_url = "#{base_url}/search/"
    zeiri4_search = Nokogiri::HTML(open(search_url))
    search_data = zeiri4_search.css('.dl_table_striped').children

    # 北海道 Done
    # area_text = search_data[1].text
    # area_data = search_data[3].children[1].children

    # 東北地方 Done
    # search_data[5].children.text
    # area_data = search_data[7].children[1].children

    # 東京 Done
    # area_text = search_data[9].children.text
    # area_data = search_data[11].children[1].children

    # 関東地方 Done
    # area_text = search_data[13].children.text
    # area_data = search_data[15].children[1].children

    # 北陸地方 Done
    # area_text = search_data[17].children.text
    # area_data = search_data[19].children[1].children

    # 東海地方 Done
    # area_text = search_data[21].children.text
    # area_data = search_data[23].children[1].children

    # 甲信越地方 Done
    # area_text = search_data[25].children.text
    # area_data = search_data[27].children[1].children

    # 関西地方 Done
    # area_text = search_data[29].children.text
    # area_data = search_data[31].children[1].children

    # 中国地方 Done
    # p search_data[33].children.text
    # p search_data[35].children[1].children


    # 九州地方 Done
    # area_text = search_data[41].children.text
    # area_data = search_data[43].children[1].children

    # 沖縄 Done
    area_text = search_data[45].children.text
    area_data = search_data[47].children[1].children
    (area_data.length).times do |i|
      if area_data.children[i]&.name == 'a'
        prefecture_text = area_data.children[i].text
        zeiri4_area = Nokogiri::HTML(open(base_url + area_data.children[i][:href]))
        sleep 0.02
        zeiri4_area_data = zeiri4_area.css('.js-accordionBody.js-tabBody.b-tab__body.uaLbl_104')[0].css('li')
        (zeiri4_area_data.length).times do |j|
          if zeiri4_area_data[j]&.text && zeiri4_area_data[j]&.text
            if zeiri4_area_data[j].children[1].children[1]&.text
              city_text = zeiri4_area_data[j].children[1].children[0].text.chop
              city = City.create(
                  area: area_text,
                  prefecture: prefecture_text,
                  city: city_text,
              )

              1000.times do |index|
                page = index + 1
                city_url = "#{base_url}#{zeiri4_area_data[j].children[1][:href]}?page=#{page}"
                zeiri4_city = Nokogiri::HTML(open(city_url))
                city_data = zeiri4_city.css('#firm-result .b-firmSearchPanel .b-firmSearchPanel__title a')
                break if city_data.blank?
                city_data.each do |cd|
                  sleep 0.01
                  p "#{base_url}/#{cd[:href]}"
                  if cd[:href].include?('nf')
                    fetch_info_data_nf("#{base_url}/#{cd[:href]}", city)
                  else
                    fetch_info_data_n("#{base_url}/#{cd[:href]}", city)
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  def fetch_info_data_n(url, city)
    zeiri4 = Nokogiri::HTML(open(url))
    data = zeiri4.css(".js-tab-firmDetail").children

    specialty_field = []
    specialty_industry = []
    handling_software = []
    main_info_data = nil
    detail_info_data = nil
    data.each do |d|
      title = d&.children && d.children[1]&.children && d.children[1].children[0]&.text
      if title == '事務所プロフィール'
        main_info_data = d.children[3]
      elsif title == '代表税理士'
        detail_info_data = d.children[3]
      elsif title == '得意分野'
        good_field_data = d.children[3]
        (good_field_data.children.length / 2).times do |i|
          specialty_field.push(good_field_data.children[i*2+1]&.text)
        end
      elsif title == '得意業種'
        good_business_data = d.children[3]
        (good_business_data.children.length / 2).times do |i|
          specialty_industry.push(good_business_data.children[i*2+1]&.text)
        end
      elsif title == '取扱い会計ソフト'
        handling_softs_data = d.children[3]
        (handling_softs_data.children.length / 2).times do |i|
          handling_software.push(handling_softs_data.children[i*2+1]&.text)
        end
      end
    end

    TaxAccountant.create(
        detailed: true,
        cities_id: city.id,
        office_name: main_info_data && main_info_data.children[3]&.text,
        location: main_info_data && main_info_data.children[7]&.text,
        access: main_info_data && main_info_data.children[11]&.text,
        belongs_number: main_info_data && main_info_data.children[15]&.text,
        representative_name: detail_info_data && detail_info_data.children[3]&.text.strip,
        belongs_council: detail_info_data && detail_info_data.children[7]&.text.strip,
        registration_year: detail_info_data && detail_info_data.children[11]&.text.strip,
        specialty_field: specialty_field,
        specialty_industry: specialty_industry,
        handling_software: handling_software,
        source_url: url,
    )
  end

  def fetch_info_data_nf(url, city)
    zeiri4 = Nokogiri::HTML(open(url))
    data = zeiri4.css(".b-nfProfile__container").children

    TaxAccountant.create(
        detailed: false,
        cities_id: city.id,
        office_name: data[1].css('.b-nfProfile__ttl').children[0]&.text.strip,
        location: data[1].css('.b-nfProfile__dl').children[3].children[0]&.text,
        nearest_station: data[1].css('.b-nfProfile__dl').children[7].children[0]&.text,
        belongs_number: data[1].css('.b-nfProfile__dl').children[11].children[0]&.text,
        belongs_name: data[3].children[1].children[3].children[1].children[0]&.text,
        source_url: url,
    )
  end
end

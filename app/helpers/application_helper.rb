# frozen_string_literal: true

module ApplicationHelper
  def insert_erb(url)
    unless url == 'public'
      raw ERB.new(File.open(url).read).result(binding)
    end
  end

  def field_type
    [
        %w(顧問税理士・法人決算 0),
        %w(個人確定申告 1),
        %w(会社設立・起業 2),
        %w(節税対策 3),
        %w(事業承継・M&A 4),
        %w(相続税 5),
        %w(融資・資金調達・金融機関対応 6),
        %w(記帳・経理業務サポート 7),
        %w(給与計算・年末調整 8),
        %w(助成金・補助金申請 9),
        %w(海外税務 10),
        %w(税務調査対応 11),
    ]
  end

  def field_type_from_number(num)
    field_type.find { |item| item[1] == num.to_s }[0]
  end

  def prefectures
    [
        %w(北海道 0),
        %w(青森県 1),
        %w(岩手県 2),
        %w(宮城県 3),
        %w(秋田県 4),
        %w(山形県 5),
        %w(福島県 6),
        %w(茨城県 7),
        %w(栃木県 8),
        %w(群馬県 9),
        %w(埼玉県 10),
        %w(千葉県 11),
        %w(東京都 12),
        %w(神奈川県 13),
        %w(新潟県 14),
        %w(富山県 15),
        %w(石川県 16),
        %w(福井県 17),
        %w(山梨県 18),
        %w(長野県 19),
        %w(岐阜県 20),
        %w(静岡県 21),
        %w(愛知県 22),
        %w(三重県 23),
        %w(滋賀県 24),
        %w(京都府 25),
        %w(大阪府 26),
        %w(兵庫県 27),
        %w(奈良県 28),
        %w(和歌山県 29),
        %w(鳥取県 31),
        %w(島根県 32),
        %w(岡山県 33),
        %w(広島県 34),
        %w(山口県 35),
        %w(徳島県 36),
        %w(香川県 37),
        %w(愛媛県 38),
        %w(高知県 39),
        %w(福岡県 40),
        %w(佐賀県 41),
        %w(長崎県 42),
        %w(熊本県 43),
        %w(大分県 44),
        %w(宮崎県 45),
        %w(鹿児島県 46),
    ]
  end

  def prefectures_from_number(num)
    prefectures.find { |item| item[1] == num.to_s }[0]
  end
end

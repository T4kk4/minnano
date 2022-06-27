class CreateTaxAccountants < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_accountants do |t|
      # nf 税理士事務所名、所在地、最寄り駅、所属税理士名
      # f or nf
      t.boolean :detailed
      # 税理士事務所名
      t.string  :office_name
      t.references  :city
      # 所在地(f,nf)
      t.string  :location

      # アクセス
      t.string  :access
      # 最寄り駅(nf)
      t.string  :nearest_station

      # 所属税理士数
      t.integer :belongs_number

      # 代表税理士名
      t.string  :representative_name
      # 所属税理士会
      t.string  :belongs_council
      # 税理士登録年
      t.string  :registration_year
      # 所属税理士(nf)
      t.string  :belongs_name

      # 得意分野
      t.string  :specialty_field,    array: true
      # 得意業種
      t.string  :specialty_industry, array: true
      # 取扱い会計ソフト
      t.string  :handling_software,  array: true

      t.string :source_url

      # 検索結果の優先度
      t.integer :priority, default: 0

      # 税理士の画像
      t.string :image_url

      # contact可能かどうか
      t.boolean :contact, default: false

      # プロフィール
      t.text :profile

      # コンテンツ(Markdown)
      t.text :contents

      # 学歴
      t.string :educational_background

      # 実績
      t.text :achievement

      # 経歴(Markdown)
      t.text :career

      # 資格
      t.string :license, array: true

      t.timestamps
    end

    add_index :tax_accountants, :detailed
    add_index :tax_accountants, [:office_name, :location], unique: true
  end
end

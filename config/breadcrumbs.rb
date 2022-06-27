crumb :root do
  link "みんなの税理士相談所", root_path
end

crumb :search do
  link '検索結果一覧', search_path
end

crumb :tac_accountant do |tax_accountant|
  link tax_accountant.office_name, tax_accountant_path(tax_accountant)
  parent :search
end

crumb :articles do
  link '記事一覧', articles_path
end

crumb :article do |article|
  link article.title, article_path(article)
  parent :articles
end

crumb :services do
  link 'サービス概要', services_path
end

crumb :contacts do
  link 'お問い合わせ', contacts_path
end

crumb :entry do
  link 'パートナー登録申請', contacts_path
end

crumb :t1 do
  link '事業承継・M&A', t1_path
end

crumb :t2 do
  link '顧問税理士・法人決算', t2_path
end

crumb :t3 do
  link '個人確定申告', t3_path
end

crumb :t4 do
  link '会社設立・起業', t4_path
end

crumb :t5 do
  link '融資・資金調達・金融機関対応', t5_path
end

crumb :t6 do
  link '資金繰り表作成・経営指導サポート', t6_path
end

crumb :t7 do
  link '記帳・経理業務サポート', t7_path
end

crumb :t8 do
  link '税務調査対応', t8_path
end

crumb :t9 do
  link '給与計算・年末調整', t9_path
end


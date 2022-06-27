namespace :account do
  desc 'account_tasks'

  def update_sf(specialty_field, from, to)
    specialty_field.each do |sf|
      if sf == from
        specialty_field.delete(from)
        to.each do |t|
          specialty_field.push(t)
        end
        specialty_field.uniq
      end
    end
    specialty_field
  end

  task update_sf: :environment do
    accounts = TaxAccountant.all
    accounts.each do |ta|
      specialty_field = ta.specialty_field
      unless specialty_field.nil?
        if specialty_field.size != 0
          # new_specialty_field = update_sf(specialty_field,"節税", ["節税対策"])
          # new_specialty_field = update_sf(new_specialty_field,"税務調査", ["税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士", ["顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"経理・決算", ["記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"税金・お金", [])
          # new_specialty_field = update_sf(new_specialty_field,"会社設立", ["会社設立・起業"])
          # new_specialty_field = update_sf(new_specialty_field,"資金調達", ["融資・資金調達・金融機関対応"])
          # new_specialty_field = update_sf(new_specialty_field,"確定申告", ["個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士 節税 確定申告", ["顧問税理士・法人決算", "節税対策", "個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士 経理・決算", ["顧問税理士・法人決算", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士 会社設立 確定申告", ["顧問税理士・法人決算", "会社設立・起業", "個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士 資金調節税対策", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "節税対策"])
          # new_specialty_field = update_sf(new_specialty_field,"給与計算・年末調整", ["給与計算・年末調整"])
          # new_specialty_field = update_sf(new_specialty_field,"会社の税務を中心に担当しています。", ["顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"通常の税金の申告から予算作成も行いますが専門はIPOですので、会計から組織作りまで対応しております。", [])
          # new_specialty_field = update_sf(new_specialty_field,"また税務調査立会単独の仕事も行っていますのでこちらのご要望決算、税金・お金", ["税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"資産税全般　", [])
          # new_specialty_field = update_sf(new_specialty_field,"相続税申告　", ["相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"還付申告　", ["個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"生前贈与対策　", ["相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"事業承継対策　", ["事業承継・M&A"])
          # new_specialty_field = update_sf(new_specialty_field,"確定申告\t\t\t\t\t\t", ["個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、 経理及び決算サポート、経営企画支援、システム導入(MFシリーズやKintone、Sales forceなどの案件管 顧問税理士", ["顧問税理士・法人決算", "記帳・経理業務サポート", "資金繰り表作成・経営指導サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"節税", ["節税対策"])
          # new_specialty_field = update_sf(new_specialty_field,"会社設立", ["会社設立・起業"])
          # new_specialty_field = update_sf(new_specialty_field,"確定申告", ["個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"税務調査", ["税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"経理・決算", ["記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士　事業承継税制の検討　融資相談・銀行同行　確定申告　相続税申告　遺産分割協議書と相続手続き　不動産の名義変更手続き（司法書士と行政書士と連理士、節税、相続税、税金・お金", ["顧問税理士・法人決算","事業承継・M&A","融資・資金調達・金融機関対応","個人確定申告","相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、相続税", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "節税対策", "相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"記帳代行、税務相談、申告書作成、税務調査対応、組織再編成、経営計画作成、法人設立、清算、融資支援、会計監査等", ["記帳・経理業務サポート","顧問税理士・法人決算","税務調査対応","資金繰り表作成・経営指導サポート","会社設立・起業","融資・資金調達・金融機関対応"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、確定申告、、確定申告、相続税、税務調査、経理・決算、（M&A、経営計画策定)", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "節税対策", "会社設立・起業", "個人確定申告", "相続税", "税務調査対応", "記帳・経理業務サポート", "事業承継・M&A", "資金繰り表作成・経営指導サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、税務調査", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "会社設立・起業", "税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、会社設立、確定申告、相続税", ["顧問税理士・法人決算","会社設立・起業","個人確定申告", "節税対策"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、節税、会社設立、確定申告", ["顧問税理士・法人決算","節税対策","会社設立・起業","個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設算、税金・お金\t\t\t\t\t\t", ["顧問税理士・法人決算","融資・資金調達・金融機関対応","節税対策","会社設立・起業"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、確定申告、経理・決算", ["顧問税理士・法人決算","個人確定申告","記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"経理・決算\t\t\t\t\t\t", ["記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、経理・決算、税金・お金", ["顧問税理士・法人決算", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、確定申告、税務調査、経理・決算、税金・お金", ["顧問税理士・法人決算", "個人確定申告", "税務調査対応", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"主に小規模企業（個人、法人）への節税対策", ["節税対策"])
          # new_specialty_field = update_sf(new_specialty_field,"\t\"", [])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、節税、会社設立、確定申告、相続税、経理・決算、税金・お金", ["顧問税理士・法人決算", "節税対策", "会社設立・起業", "個人確定申告", "相続税", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、確定申告、経理・決算、会社設立\t\t\t\t\t\t", ["顧問税理士・法人決算", "個人確定申告", "記帳・経理業務サポート", "会社設立・起業"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士・確定申告・相続\t", ["顧問税理士・法人決算", "個人確定申告", "相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、会社設立、確定申告、相続税、税務調査、ビジネスマッチ\t\t\t\t\t", ["顧問税理士・法人決算", "会社設立・起業", "個人確定申告", "相続税", "税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、 相続税、税務調査", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "節税対策", "会社設立・起業", "相続税", "税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、確定申告、", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "会社設立・起業", "個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"相続税、税務調査、経理・決算、税金・お金", ["相続税", "税務調査対応", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応"])
          # new_specialty_field = update_sf(new_specialty_field,"相続税、経理・決顧問税理士、節税、会お金", ["相続税", "記帳・経理業務サポート", "顧問税理士・法人決算", "節税対策"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士,資金調達,節税,会社設立,相続税\t\t\t\t\t\t", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "節税対策", "会社設立・起業", "相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"法人顧問税理士・相続税申告\t\t\t\t\t\t", ["顧問税理士・法人決算", "相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、確定申告、相続税、税務調査、経理・決算", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "会社設立・起業", "個人確定申告", "相続税", "税務調査対応", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問契約", ["顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"ビジネスモデル構築", ["資金繰り表作成・経営指導サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"サービス開発ンサルティング", ["資金繰り表作成・経営指導サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"業務効率化", ["資金繰り表作成・経営指導サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"IT化支援\t\t\t\t\t\t", ["資金繰り表作成・経営指導サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"経緯・決算", ["資金繰り表作成・経営指導サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"創業融資", ["融資・資金調達・金融機関対応"])
          # new_specialty_field = update_sf(new_specialty_field,"税務調査対策", ["税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"経理・決算税金・お金", ["記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"税金・お金\t\t\t\t\t\t", [])
          # new_specialty_field = update_sf(new_specialty_field,"経理・顧問税理士", ["記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"決算", ["顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"会社設立支援", ["会社設立・起業"])
          # new_specialty_field = update_sf(new_specialty_field,"税金", [])
          # new_specialty_field = update_sf(new_specialty_field,"資金調達支援", ["融資・資金調達・金融機関対応"])
          # new_specialty_field = update_sf(new_specialty_field,"贈与税", ["相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"譲渡所より提携事務所に紹介）", [])
          # new_specialty_field = update_sf(new_specialty_field,"☆税務調査", ["税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"税務調査　", ["税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"節税顧問税理士", ["節税対策", "顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"節税対策", ["会社設立・起業"])
          # new_specialty_field = update_sf(new_specialty_field,"不動産", [])
          # new_specialty_field = update_sf(new_specialty_field,"金融", [])
          # new_specialty_field = update_sf(new_specialty_field,"飲食", [])
          # new_specialty_field = update_sf(new_specialty_field,"流通・小売", [])
          # new_specialty_field = update_sf(new_specialty_field,"IT・インターネット", [])
          # new_specialty_field = update_sf(new_specialty_field,"美容", [])
          # new_specialty_field = update_sf(new_specialty_field,"運輸・物流", [])
          # new_specialty_field = update_sf(new_specialty_field,"製造", [])
          # new_specialty_field = update_sf(new_specialty_field,"教育", [])
          # new_specialty_field = update_sf(new_specialty_field,"医療・福祉", [])
          # new_specialty_field = update_sf(new_specialty_field,"相続税対策", [])
          # new_specialty_field = update_sf(new_specialty_field,"税", [])
          # new_specialty_field = update_sf(new_specialty_field,"事業承継・M&A", ["事業承継・M&A"])
          # new_specialty_field = update_sf(new_specialty_field,"個人確定申告会社設立・起業", ["個人確定申告", "会社設立・起業"])
          # new_specialty_field = update_sf(new_specialty_field,"事業承継", ["事業承継・M&A"])
          # new_specialty_field = update_sf(new_specialty_field,"個人確定申告、（譲渡・贈与）", ["個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"相続税節税対策", ["相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"税金・お金  ", [])
          #
          # new_specialty_field = update_sf(new_specialty_field," }", [])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士 資金調達 税金・お金", ["顧問税理士・法人決算","融資・資金調達・金融機関対応"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士 相続税 税務調査", ["顧問税理士・法人決算", "相続税", "税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士 確定申告 相続税", ["顧問税理士・法人決算", "個人確定申告", "相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金Sales forceなどの案件管理システム)\t\t\t\t\t\t", ["顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"法人顧問が中心です\t\t\t\t\t", ["顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"相続税の申告、不動産の譲渡・贈与、賃貸業の会計顧問\t\t\t\t\t\t", ["相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、節税、会社設立、確定申告、相続税、税務調査、経理・決算、税金・お金", ["顧問税理士・法人決算", "節税対策", "会社設立・起業", "個人確定申告", "相続税", "税務調査対応", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士　事業承継税制の検討　融資定申告　相続税申告　遺産分割協議書と相続手続き　不動産の名義変更手続き（司法書士と行政書士と連携）\t\t\t\t\t\t", ["顧問税理士・法人決算", "相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、確定申告、相続税、税務調査", ["顧問税理士・法人決算", "個人確定申告", "相続税", "税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、節税、会社設立、確定申告、税務調査、経理・決算、税金・お金", ["顧問税理士・法人決算", "節税対策", "会社設立・起業", "個人確定申告", "税務調査対応", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、節税、相続税、税金・お金&A　社会保険　などあります。", ["顧問税理士・法人決算", "節税対策", "相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、確定申告、相続税、税務調査、経理・決算、（M&A、経営計画策定)", ["顧問税理士・法人決算","融資・資金調達・金融機関対応", "節税対策", "会社設立・起業", "個人確定申告", "相続税", "税務調査対応", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、相続税、税務調査、経理・決算、税金・お金\t\t\t\t\t\t", ["顧問税理士・法人決算","融資・資金調達・金融機関対応", "節税対策", "会社設立・起業", "相続税", "税務調査対応", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士 節税", ["顧問税理士・法人決算", "節税対策"])
          # new_specialty_field = update_sf(new_specialty_field,"確定申告・税務顧問理体制の構築指導・生命保険の提案\t\t\t\t\t", ["個人確定申告", "顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"試算表から読み取れる事の説明\t\t\t\t\t\t", [])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、会社設立、確定申告、相続税、税務調査、ビジネスマッチング　\t\t\t\t\t\t", ["顧問税理士・法人決算", "会社設立・起業", "個人確定申告", "相続税", "税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"相続", ["相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、会社設立、確定申告、相続税、税務調査", ["顧問税理士・法人決算", "会社設立・起業", "個人確定申告", "相続税", "税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"税務顧問、確定申告、財務顧問\"譲渡所得関係の確定申告", ["個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"税務", [])
          # new_specialty_field = update_sf(new_specialty_field,"調査", [])
          # new_specialty_field = update_sf(new_specialty_field,"建設・建築", [])
          # new_specialty_field = update_sf(new_specialty_field,"節税対策相続税", ["相続税"])
          # new_specialty_field = update_sf(new_specialty_field," ", [])
          # new_specialty_field = update_sf(new_specialty_field,"また税務調査立会単独の仕事も行っていますのでこちらのご要望もありましたら幸いです。\t\t\t\t\t\t", [])
          # new_specialty_field = update_sf(new_specialty_field,"相続税、経理・決顧問税・決算、税金・お金", ["相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"節税資金調達、節税、会社設立、相続税、税務調査、経理・決算、税金・お金", ["節税対策", "会社設立・起業", "相続税", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"創業支援", ["会社設立・起業"])
          # new_specialty_field = update_sf(new_specialty_field,"相続税申告", [])
          # new_specialty_field = update_sf(new_specialty_field,"税金・お金  　\"\t\t\t\t\t\t", [])
          # new_specialty_field = update_sf(new_specialty_field,"相続税（場合により提携事務所に紹介）", ["相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"節税, 会社設立", ["会社設立・起業", "節税対策"])
          # new_specialty_field = update_sf(new_specialty_field,"法人税", [])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、節税、相続税、税金・お金", ["顧問税理士・法人決算", "節税対策", "相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金繰り支援、税金対策\t\t\t\t\t\t", ["顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、経理・決算、税金・お金資相談・銀行同行　確定申告　相続税申告　遺産分割協議書と相続手続き　不動産の名義変更手続き（司法書士と行政書士と連携）\t\t\t\t\t\t", ["顧問税理士・法人決算","融資・資金調達・金融機関対応", "節税対策", "会社設立・起業", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、経理・決算、税金・お金", ["顧問税理士・法人決算","融資・資金調達・金融機関対応", "節税対策", "会社設立・起業", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、融資相談・銀行同行　確定申告　相続税申告　遺産分割協議書と相続手続き　不動産の名義変更手続き（司法書士と行政書士と連携）\t\t\t\t\t\t", ["顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、確定申告、相続税、税務調査、経理・決算、税金・　社会保険　などあります。", ["顧問税理士・法人決算", "節税対策", "個人確定申告", "相続税"])
          # new_specialty_field = update_sf(new_specialty_field,"確定申告・税務顧問（法人・個人）・記帳指導・内部管理体制の構築指導・生命保険の提案\t\t\t\t\t", ["個人確定申告", "顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"税務顧問、確定申告、財務顧問\t\t\t\t\t\t", ["顧問税理士・法人決算", "個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"相続税、経理・決顧問税理士、節税、会社設立、相続税、税務調査、経理・決算、税金・お金", ["相続税", "顧問税理士・法人決算", "節税対策", "会社設立・起業", "税務調査対応", "記帳・経理業務サポート"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、 経理及び決算サポート、経営企画支援、システム導入(MFシリーズやKintone、Sales forceなどの案件管理システム)\t\t\t\t\t\t", ["顧問税理士・法人決算"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士　事業承継税制の検討　融資相談・銀行同行　確定申告　相続税申告　遺産分割協議書と相続手続き　不動産の名義変更手続き（司法書士と行政書士と連携）\t\t\t\t\t\t", ["顧問税理士・法人決算", "相続税", "個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、確定申告、相続税、税務調査、経理・決算、税金・お金", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "節税対策", "会社設立・起業", "個人確定申告", "相続税", "税務調査対応"])
          # new_specialty_field = update_sf(new_specialty_field,"上記はすべて通常業務として日頃取り組んでることなので得意としております。", [])
          # new_specialty_field = update_sf(new_specialty_field,"それ以外には、M&A　社会保険　などあります。", [])
          # new_specialty_field = update_sf(new_specialty_field,"顧問税理士、資金調達、節税、会社設立、確定申告、経理・決算、税金・お金", ["顧問税理士・法人決算", "融資・資金調達・金融機関対応", "節税対策", "会社設立・起業", "個人確定申告"])
          # new_specialty_field = update_sf(new_specialty_field,"サービス開発", [])
          # new_specialty_field = update_sf(new_specialty_field,"資金調達（クラウドファンディング,融資,補助金）", [])
          # new_specialty_field = update_sf(new_specialty_field,"人事コンサルティング", [])
          # new_specialty_field = update_sf(new_specialty_field,"譲渡所得関係の確定申告", [])
          # new_specialty_field = update_sf(new_specialty_field,"", [])
          new_specialty_field = update_sf(specialty_field,"資金繰り表作成・経営指導サポート", [])
          new_specialty_field = update_sf(new_specialty_field,"事業承継・M＆A", ["事業承継・M&A"])
          ta.update_attributes(specialty_field: new_specialty_field)
        end
      end
    end

    accounts = TaxAccountant.all
    unique_specialty_fields = []
    accounts.each do |ta|
      specialty_field = ta.specialty_field
      unless specialty_field.nil?
        if specialty_field.size != 0
          specialty_field.each do |sf|
            unique_specialty_fields.push(sf)
          end
        end
      end
    end

    unique_specialty_fields.uniq.each { |v| p v }
  end

  task export: :environment do
    accounts = TaxAccountant.all
    File.open("account_assets/account.csv", "w") do |f|
      csv = "id,office_name,location,representative_name,belongs_council,registration_year,belongs_name,source_url\n"
      accounts.each do |account|
        csv << "#{account.id},#{account.office_name},#{account.location},#{account.representative_name},#{account.belongs_council},#{account.registration_year},#{account.belongs_name},#{account.source_url}\n"
      end
      f.puts(csv)
    end
  end

  task image: :environment do
    CSV.foreach("account_assets/account_image.csv", headers: true) do |row|
      image = Image.new
      begin
        File.open("account_assets/account_images/#{row[3]}.png") do |f|
          image.data = f
        end
      rescue
        begin
          File.open("account_assets/account_images/#{row[3]}.jpg") do |f|
            image.data = f
          end
        rescue
          begin
            File.open("account_assets/account_images/#{row[3]} .png") do |f|
              image.data = f
            end
          rescue
            begin
              File.open("account_assets/account_images/#{row[3]} .jpg") do |f|
                image.data = f
              end
            rescue
              p row[3]
            end
          end
        end
      end
      image.file_name = row[1]
      image.save!
      image.reload
      TaxAccountant.find(row[2]).update(image_url: image.data)
    end
  end

  task update_priority: :environment do
    account_ids = [
        30079,
        36915,
        39435,
        6752,
        36954,
        63800,
        38116,
        29433,
        63776,
        33441,
        4464,
        3677,
        52542,
        31094,
        32036,
        32037,
        5861,
        5883,
        63815,
        5860,
        63823,
        40552,
        40655,
        40235,
        40101,
        40095,
        34860,
        63804,
        63803,
        48796,
        48617,
        63802,
        49609,
        50361,
        63814,
        63806,
        63805,
        46747,
        47816,
        46811,
        46811,
        46774,
        50233,
        47008,
        63824,
        49238,
        63801,
        46732,
        48636,
        52079,
        52088,
        52541,
        52547,
        52541,
        52147,
        52086,
        51682,
        44352,
        43917,
        43924,
        44292,
        44078,
        44101,
        63825,
        44747,
        44881,
        63816,
        48,
        63826,
        57862,
        60096,
        63827,
        58483,
        58857,
        63828,
        57894,
        61685,
        19648,
        17490,
        17471,
        17527,
        15283,
        63812,
        12750,
        12771,
        12785,
        18453,
        16049,
        12967,
        63810,
        15461,
        17540,
        19192,
        9713,
        9280,
        8649,
        8440,
        8568,
        10437,
        10228,
        56191,
        8340,
        20366,
        63829,
        24588,
        25527,
        26330,
        24592,
        26669,
        63809,
        24577,
        63811,
        24586,
        25764,
        25770,
        63822,
        24035,
    ]

    account_ids.each do |id|
      TaxAccountant.find(id).update(priority: 10000)
    end
  end
end

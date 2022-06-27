ActiveAdmin.register TaxAccountant do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
    f.input :city_id, as: :number
    f.inputs except: [:specialty_field, :specialty_industry, :handling_software, 'city']
    f.inputs do
      f.input :specialty_field_raw, as: :text
      f.input :specialty_industry_raw, as: :text
      f.input :handling_software_raw, as: :text
    end
    f.actions
  end

  controller do
    def permitted_params
      ok = true
      ok_specialty = [
          "事業承継・M&A",
          "顧問税理士・法人決算",
          "個人確定申告",
          "会社設立・起業",
          "節税対策",
          "融資・資金調達・金融機関対応",
          "記帳・経理業務サポート",
          "税務調査対応",
          "給与計算・年末調整",
          "助成金・補助金申請",
          "海外税務",
          "相続税",
      ]
      params.to_unsafe_h['tax_accountant'] && params.to_unsafe_h['tax_accountant']['specialty_field_raw'].each_line do |line|
        ok = false unless ok_specialty.include?(line.chomp)
      end
      if ok
        params.permit!
      else
        params['tax_accountant'].delete(:specialty_field_raw)
        params.permit!
      end
    end
  end

  filter :office_name
  filter :city_prefecture, as: :string
  filter :city_city, as: :string
  filter :priority
  filter :detailed

  index do
    column :id
    column :detailed
    column :office_name
    column :prefecture do |ta|
      ta.city&.prefecture
    end
    column :city
    column :priority
    actions
  end
end

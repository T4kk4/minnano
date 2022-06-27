ActiveAdmin.register Breadcrumb do
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

  permit_params :title,
                :category_1_name,
                :category_1_url,
                :category_2_name,
                :category_2_url,
                :category_3_name,
                :category_3_url,
                :category_4_name,
                :category_4_url,
                :category_5_name,
                :category_5_url

  index do
    column :id
    column :category_1_name
    column :category_2_name
    column :category_3_name
    column :category_4_name
    column :category_5_name
    actions
  end
end

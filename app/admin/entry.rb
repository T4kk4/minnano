ActiveAdmin.register Entry do
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

 index do
  column :id
  column :tax_account_number
  column :user_name
  column :office_name
  column :location
  column :phone_number
  column :mail_address
  column :created_at
  actions
 end

end

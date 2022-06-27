ActiveAdmin.register ArticleContent do
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

  permit_params :position, :body, :displayed, :content_type, :article_id

  #index do
  #  column :content_type
  #  column :position
  #  column :body
  #  column :displayed
  #  column :article
  #  column :created_at
  #  actions
  #end

  form do |f|
    f.inputs do
      f.input :article_id, as: :number
      f.input :content_type
      f.input :position
      f.input :body
      f.input :displayed
    end
    f.actions
  end

  filter :article_id
  filter :content_type
  filter :displayed

end

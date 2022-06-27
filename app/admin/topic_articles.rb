ActiveAdmin.register TopicArticle do
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
                :topic_id,
                :thumbnail_url,
                :meta_description,
                :category,
                :table_contents,
                :tags,
                :related_articles,
                :status,
                :recommend,
                :released_at,
                :priority,
                :breadcrumb_id,
                :keyword

  index do
    column :id
    column :title
    column :topic_id
    column :status
    column :released_at
    column :recommend
    column :priority
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :breadcrumb_id, as: :number
      f.input :keyword
      f.input :topic_id, as: :number
      f.input :thumbnail_url
      f.input :meta_description
      f.input :status
      f.input :recommend
      f.input :priority
    end
    f.actions
  end


  filter :id
  filter :title
  filter :keyword
  filter :topic_id
  filter :status
  filter :recommend

  action_item only: [:edit, :show] do
    link_to 'Preview', admin_topic_article_preview_path(id: params[:id])
  end
end

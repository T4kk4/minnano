ActiveAdmin.register Image do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :file_name, :data, :display_caption, :display_quote, :quote_url
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  before_create do |image|
    image.quote = "[#{image.file_name}](#{image.quote_url} \"#{image.file_name}\")"
  end

  before_update do |image|
    image.quote = "[#{image.file_name}](#{image.quote_url} \"#{image.file_name}\")"
  end

  form do |f|
    f.inputs do
      f.input :file_name
      f.input :data
      f.input :display_caption
      f.input :quote_url
      f.input :display_quote
    end
    f.actions
  end

  index do
    column :id
    column "preview" do |image|
      image_tag image.data.to_s, class: 'my-thumb-size'
    end
    #column :file_name
    column :display_caption
    column "Content" do |image|
      if image.display_quote
        "![#{image.file_name}](#{image.data} 'q:#{image.quote}=#{image.width}x#{image.height}')"
      elsif image.display_caption
        "![#{image.file_name}](#{image.data} '#{image.file_name}=#{image.width}x#{image.height}')"
      else
        "![#{image.file_name}](#{image.data} '=#{image.width}x#{image.height}')"
      end
    end
    actions
  end

  show do
    attributes_table do
      row :file_name
      row :data
      row :display_caption
      row :quote_url
      row :display_quote
      row :quote
      row :content do |image|
        if image.display_quote
          "![#{image.file_name}](#{image.data} 'q:#{image.quote}=#{image.width}x#{image.height}')"
        elsif image.display_caption
          "![#{image.file_name}](#{image.data} '#{image.file_name}=#{image.width}x#{image.height}')"
        else
          "![#{image.file_name}](#{image.data} '=#{image.width}x#{image.height}')"
        end
      end
      row :created_at
      row :updated_at
    end
  end
end

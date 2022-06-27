ActiveAdmin.register_page 'Topic Article Import' do
  controller do
    def index
    end
  end

  content do
    render template: 'admin/topic_article_import'
  end

  page_action :create, method: :post do
    before_article_content_count = TopicArticleContent.count
    article_content = []
    CSV.foreach(params[:csv_file].path, headers: true) do |row|
      TopicArticle.find(row['article_id']).topic_article_contents.delete_all
      article_content << TopicArticleContent.new(
          {
              topic_article: TopicArticle.find(row['article_id']),
              content_type: row['content_type'],
              body: row['body'],
              line_number: $.,
          }
      )
      TopicArticle.find(row['article_id']).touch
    end

    errors = []
    ActiveRecord::Base.transaction do
      article_content.each do |tc|
        unless tc.save
          errors << "#{tc.errors.full_messages}:#{tc.line_number}行目"
        end
      end
      raise ActiveRecord::Rollback if errors.present?
    end

    flash[:errors] = errors.join(", ").html_safe if errors.present?
    flash[:notice] = 'CSVをインポートしました！'unless errors.present?

    TopicArticleContent.count - before_article_content_count
    redirect_to manager_topic_article_import_path
  end
end

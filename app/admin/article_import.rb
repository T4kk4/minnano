ActiveAdmin.register_page 'Article Import' do
  controller do
    def index
    end
  end

  content do
    render template: 'admin/article_import'
  end

  page_action :create, method: :post do
    before_article_content_count = ArticleContent.count
    article_content = []
    CSV.foreach(params[:csv_file].path, headers: true) do |row|
      Article.find(row['article_id']).article_contents.delete_all
      article_content << ArticleContent.new(
          {
              article: Article.find(row['article_id']),
              content_type: row['content_type'],
              body: row['body'],
              line_number: $.,
          }
      )
      Article.find(row['article_id']).touch
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

    ArticleContent.count - before_article_content_count
    redirect_to manager_article_import_path
  end
end

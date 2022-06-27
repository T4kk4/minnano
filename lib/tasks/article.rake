namespace :article do
  desc 'article_tasks'

  task keyword: :environment do
    CSV.foreach('./lib/assets/keywords.csv', headers: true) do |row|
      if row['ID'].present?
        article = Article.find(row['ID'].to_i)
        article.keyword = row['kw']
        article.save
      end
    end
  end
end


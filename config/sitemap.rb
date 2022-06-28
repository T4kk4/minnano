# Set the host name for URL creation
# SitemapGenerator::Sitemap.default_host = 'https://minnano-zeirishi.jp'
# SitemapGenerator::Sitemap.sitemaps_host = 'https://minnano-zeirishi.s3-ap-northeast-1.amazonaws.com'
# SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
#     'minnano-zeirishi',
#     aws_access_key_id: ENV['ACCESS_KEY_ID'],
#     aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
#     aws_region: 'ap-northeast-1'
# )

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add root_path
  add services_path
  add contacts_path
  add t1_path
  add t2_path
  add t3_path
  add t4_path
  add t5_path
  add t6_path
  add t7_path
  add t8_path
  add t9_path

  Article.where(status: :released).order('updated_at desc').each do |article|
    add article_path(article), :lastmod => article.updated_at, :priority => 1.0, :changefreq => 'daily'
  end

  TopicArticle.where(status: :released).order('updated_at desc').each do |article|
    add topic_article_path(t_id: 't_3', id: article.id), :lastmod => article.updated_at, :priority => 1.0, :changefreq => 'daily'
  end

  TaxAccountant.where(priority: 10000..Float::INFINITY).each do |account|
    add tax_accountant_path(account), :lastmod => account.updated_at, :priority => 1.0, :changefreq => 'daily'
  end
end

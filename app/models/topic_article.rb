class TopicArticle < ApplicationRecord
  has_many :topic_article_contents, -> { order(position: :asc) }
  has_one :breadcrumb

  enum status: { created: 0, writing: 1, released: 2 }
end

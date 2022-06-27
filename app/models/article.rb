class Article < ApplicationRecord
  has_many :article_contents, -> { order(position: :asc) }
  belongs_to :breadcrumb, optional: true

  enum status: { created: 0, writing: 1, released: 2 }
end

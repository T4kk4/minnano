class ArticleContent < ApplicationRecord
  attr_accessor :line_number

  belongs_to :article
  acts_as_list scope: :article

  validates :body, presence: true

  enum content_type: {
      heading_level1: 0,
      heading_level2: 1,
      paragraph: 2,
      image: 3,
      list: 4,
      quote: 5,
      twitter: 6,
      youtube: 7,
      table_content: 8,
      google_map: 9,
      tax_account: 10,
      heading_level3: 11,
      my_contents: 12,
  }

  def render_with_template(markdown)
    {template: "/articles/components/#{self.content_type}", locals: {content: self.body, markdown: markdown}}
  end
end

class AddKeywordToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :keyword, :string
    add_column :topic_articles, :keyword, :string
  end
end

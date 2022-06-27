class CreateTopicArticleContents < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_article_contents do |t|
      t.integer    :content_type
      t.integer    :position
      t.text       :body
      t.boolean    :displayed, default: true, null: false

      t.references :topic_article
      t.timestamps
    end
  end
end

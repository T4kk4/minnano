class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string   :title
      t.string   :thumbnail_url
      t.text     :meta_description
      t.string   :category
      t.text     :table_contents,   array: true
      t.string   :tags,             array: true
      t.text     :related_articles, array: true
      t.integer  :status,           default: 0,     null: false
      t.boolean  :recommend,        default: false, null: false

      t.datetime :released_at
      t.timestamps
    end
  end
end

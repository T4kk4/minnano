class AddPriorityToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :priority, :integer, default: 0
  end
end

class CreateBreadcrumbs < ActiveRecord::Migration[5.2]
  def change
    create_table :breadcrumbs do |t|
      t.string :category_1_url
      t.string :category_1_name

      t.string :category_2_url
      t.string :category_2_name

      t.string :category_3_url
      t.string :category_3_name

      t.string :category_4_url
      t.string :category_4_name

      t.string :category_5_url
      t.string :category_5_name

      t.timestamps
    end

    add_reference :articles, :breadcrumb, index: true
    add_reference :topic_articles, :breadcrumb, index: true
  end
end

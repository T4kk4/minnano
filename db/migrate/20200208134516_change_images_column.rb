class ChangeImagesColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :quote, :string
    add_column :images, :display_quote, :boolean
  end
end
